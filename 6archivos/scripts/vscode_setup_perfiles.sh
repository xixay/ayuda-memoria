#!/bin/bash

# Lista de perfiles con sus extensiones específicas
declare -A profiles

# === Perfiles personalizados con sus extensiones ===

profiles["VueDev"]="johnsoncodehk.volar
vue.volar
Vue.volar
sdras.vue-vscode-snippets
vue.vscode-typescript-vue-plugin
Zignd.html-css-class-completion
Vue.vscode-typescript-vue-plugin
bradlc.vscode-tailwindcss
primefaces.primevue-snippets
"

profiles["ReactDev"]="dsznajder.es7-react-js-snippets
xabikos.ReactSnippets
formulahendry.auto-close-tag
formulahendry.auto-rename-tag
bradlc.vscode-tailwindcss
primefaces.primereact-snippets
"

profiles["AngularDev"]="angular.ng-template
johnpapa.angular2
angular.angular-essentials
google.material-design-icons
PKief.material-icon-theme
"

profiles["BackendNest"]="nestjs.nestjs-files
waldo.gitignore
xabikos.JavaScriptSnippets
casualjim.sequelize-snippets
"

profiles["Fullstack"]="johnsoncodehk.volar
vue.volar
dsznajder.es7-react-js-snippets
nestjs.nestjs-files
casualjim.sequelize-snippets
angular.ng-template
primefaces.primereact-snippets
"

# === Extensiones comunes para todos los perfiles ===

common_extensions="dracula-theme.theme-dracula
GitHub.copilot
Codeium.codeium
ms-vsliveshare.vsliveshare
"

# Crear perfiles e instalar extensiones
for profile in "${!profiles[@]}"; do
  echo "📁 Creando perfil: $profile"
  code --profile "$profile" --extensions-dir "$HOME/.vscode/extensions-$profile" --force

  echo "🔌 Instalando extensiones para $profile..."
  for ext in ${profiles[$profile]}; do
    code --install-extension "$ext" --profile "$profile"
  done

  echo "🔧 Instalando extensiones comunes en $profile..."
  for ext in $common_extensions; do
    code --install-extension "$ext" --profile "$profile"
  done

  echo "✅ Perfil '$profile' configurado."
  echo "-------------------------------"
done

echo "🎉 Todos los perfiles se han creado y configurado correctamente."
