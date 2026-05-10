import fs from 'fs';
import path from 'path';
import { globSync } from 'glob';

// Kebab-case conversion logic
function toKebabCase(str) {
  return str
    .replace(/^\d+(\.\d+)*[-\.]?/, '') // Remove leading numbers like 1-, 1.5-, 20-
    .replace(/([a-z])([A-Z])/g, '$1-$2') // camelCase to kebab-case
    .replace(/[\s_]+/g, '-') // spaces and underscores to dashes
    .toLowerCase()
    .replace(/[^a-z0-9-\/\.]/g, '') // remove special chars except slashes and dots
    .replace(/-+/g, '-') // remove double dashes
    .replace(/-\./g, '.') // remove dash before extension
    .replace(/^-+/, ''); // remove leading dashes
}

const docsDir = path.resolve('docs');

// 1. Gather all files and dirs
const allFiles = globSync('docs/**/*.md').sort((a, b) => b.length - a.length); // Process deeper paths first

const renameMap = new Map();

// Generate rename map for files
for (const file of allFiles) {
  const parsed = path.parse(file);
  if (parsed.name === 'index' || parsed.name === 'README') continue; // Skip index files

  const newName = toKebabCase(parsed.name) + '.md';
  const newPath = path.join(parsed.dir, newName);
  
  if (file !== newPath) {
    renameMap.set(file, newPath);
  }
}

// Generate rename map for directories inside docs
const allDirs = globSync('docs/**/').sort((a, b) => b.length - a.length);
for (const dir of allDirs) {
  if (dir === 'docs/' || dir === 'docs') continue;
  const parts = dir.split('/');
  const lastPart = parts[parts.length - 2]; // globSync ends with /
  if (!lastPart) continue;

  const newName = toKebabCase(lastPart);
  if (newName !== lastPart && newName.length > 0) {
    const parentDir = parts.slice(0, -2).join('/');
    const newDir = path.join(parentDir, newName) + '/';
    renameMap.set(dir, newDir);
  }
}

console.log('Mapping generated. Replacing links...');

// Replace links in content BEFORE renaming files
// This is a naive but effective replacement for local links
const filesToProcess = globSync('docs/**/*.md');

for (const file of filesToProcess) {
  let content = fs.readFileSync(file, 'utf-8');
  let changed = false;

  for (const [oldPath, newPath] of renameMap) {
    // Links are usually relative. Let's try to match basenames if they are unique enough
    // Or just replace string occurrences.
    // E.g. [Ver](./1.5-estilos como variables.md) -> [Ver](./estilos-como-variables.md)
    const oldBase = path.basename(oldPath);
    const newBase = path.basename(newPath);
    
    // We replace URL encoded versions as well
    const oldBaseEncoded = encodeURI(oldBase);
    
    if (content.includes(oldBase) || content.includes(oldBaseEncoded)) {
      content = content.split(oldBase).join(newBase);
      content = content.split(oldBaseEncoded).join(newBase);
      changed = true;
    }
  }

  if (changed) {
    fs.writeFileSync(file, content, 'utf-8');
  }
}

console.log('Renaming files and directories...');

// Rename files
for (const [oldPath, newPath] of renameMap) {
  if (fs.existsSync(oldPath) && fs.statSync(oldPath).isFile()) {
    fs.renameSync(oldPath, newPath);
    console.log(`Renamed: ${oldPath} -> ${newPath}`);
  }
}

// Rename directories
for (const [oldPath, newPath] of renameMap) {
  // Strip trailing slash for fs.existsSync
  const oldD = oldPath.replace(/\/$/, '');
  const newD = newPath.replace(/\/$/, '');
  if (fs.existsSync(oldD) && fs.statSync(oldD).isDirectory()) {
    fs.renameSync(oldD, newD);
    console.log(`Renamed DIR: ${oldD} -> ${newD}`);
  }
}

console.log('Done!');
