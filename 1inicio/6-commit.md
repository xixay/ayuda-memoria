
- [1. Tipos de commits](#1-tipos-de-commits)
  - [1.1. feat (Agrega una nueva característica)](#11-feat-agrega-una-nueva-característica)
    - [1.1.1. feat especifico](#111-feat-especifico)
    - [1.1.2. feat eliminación](#112-feat-eliminación)
  - [1.2. refers (Agrega una referencia)](#12-refers-agrega-una-referencia)
  - [1.3. fix (Corrige un error)](#13-fix-corrige-un-error)
    - [1.3.1. fix api](#131-fix-api)
  - [1.4. BREAKING CHANGES](#14-breaking-changes)
  - [1.5. refactor (Reescriben/reestructuran su código, sin embargo, no cambian ningún comportamiento de la API)](#15-refactor-reescribenreestructuran-su-código-sin-embargo-no-cambian-ningún-comportamiento-de-la-api)
  - [1.6. perf (Son confirmaciones de refactorización especiales que mejoran el rendimiento.)](#16-perf-son-confirmaciones-de-refactorización-especiales-que-mejoran-el-rendimiento)
  - [1.7. style (Que no afectan el significado (espacios en blanco, formato, punto y coma faltantes, etc.))](#17-style-que-no-afectan-el-significado-espacios-en-blanco-formato-punto-y-coma-faltantes-etc)
  - [1.8. test (Agregan pruebas faltantes o corrigen pruebas existentes.)](#18-test-agregan-pruebas-faltantes-o-corrigen-pruebas-existentes)
  - [1.9. docs (Que afecta solo a la documentación)](#19-docs-que-afecta-solo-a-la-documentación)
  - [1.10. build (Que afectan los componentes de compilación como la herramienta de compilación, la canalización ci, las dependencias, la versión del proyecto, ...)](#110-build-que-afectan-los-componentes-de-compilación-como-la-herramienta-de-compilación-la-canalización-ci-las-dependencias-la-versión-del-proyecto-)
    - [1.10.1. release](#1101-release)
  - [1.11. ops (Que afectan componentes operativos como infraestructura, implementación, respaldo, recuperación, ...)](#111-ops-que-afectan-componentes-operativos-como-infraestructura-implementación-respaldo-recuperación-)
  - [1.12. chore Miscellaneous](#112-chore-miscellaneous)

# 1. Tipos de commits
## 1.1. feat (Agrega una nueva característica)
```console
feat: agregar notificaciones por correo electrónico sobre nuevos mensajes directos
```
### 1.1.1. feat especifico
```console
feat(carrito de compras): agrega el botón increíble
```
### 1.1.2. feat eliminación
```console
feat!: eliminar el punto final de la lista de tickets
```
## 1.2. refers (Agrega una referencia)
```console
 refers to JIRA-1337 (se refiere a JIRA-1337)
```
## 1.3. fix (Corrige un error)
```console
fix: agregue el parámetro que falta a la llamada de servicio. El error se produjo debido a <razones>.
```
### 1.3.1. fix api
```console
fix(api): maneja el mensaje vacío en el cuerpo de la solicitud
fix(api): corrige el cálculo incorrecto de la suma de verificación del cuerpo de la solicitud
```
## 1.4. BREAKING CHANGES
```console
BREAKING CHANGES: los puntos de ticket ya no admiten enumerar todas las entidades.
```
## 1.5. refactor (Reescriben/reestructuran su código, sin embargo, no cambian ningún comportamiento de la API)
```console
refactor: implementar el cálculo del número de Fibonacci como recursividad
```
## 1.6. perf (Son confirmaciones de refactorización especiales que mejoran el rendimiento.)
```console
perf: reduce el uso de memoria para determinar visitantes únicos mediante HyperLogLog
```
## 1.7. style (Que no afectan el significado (espacios en blanco, formato, punto y coma faltantes, etc.))
```console
style: eliminar línea vacía
```
## 1.8. test (Agregan pruebas faltantes o corrigen pruebas existentes.)
## 1.9. docs (Que afecta solo a la documentación)
## 1.10. build (Que afectan los componentes de compilación como la herramienta de compilación, la canalización ci, las dependencias, la versión del proyecto, ...)
```console
build: actualizar dependencias
```
### 1.10.1. release
```console
build(release): `versión mejorada a 1.0.0
```
## 1.11. ops (Que afectan componentes operativos como infraestructura, implementación, respaldo, recuperación, ...)
## 1.12. chore Miscellaneous
```console
chore Miscellaneous: modificando .gitignore
```