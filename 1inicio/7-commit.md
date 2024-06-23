[<< INDICE](../README.md)
- [1. Tipos de commits](#1-tipos-de-commits)
  - [1.1. feat](#11-feat)
    - [1.1.1. feat especifico](#111-feat-especifico)
    - [1.1.2. feat eliminación](#112-feat-eliminación)
  - [1.2. refers](#12-refers)
  - [1.3. fix](#13-fix)
    - [1.3.1. fix api](#131-fix-api)
  - [1.4. BREAKING CHANGES](#14-breaking-changes)
  - [1.5. refactor](#15-refactor)
  - [1.6. perf](#16-perf)
  - [1.7. style](#17-style)
  - [1.8. test](#18-test)
  - [1.9. docs](#19-docs)
  - [1.10. build](#110-build)
    - [1.10.1. release](#1101-release)
  - [1.11. ops](#111-ops)
  - [1.12. chore](#112-chore)

# 1. Tipos de commits
## 1.1. feat
**Agrega una nueva característica**
```console
feat: agregar notificaciones por correo electrónico sobre nuevos mensajes directos
```
### 1.1.1. feat especifico
**Agrega una nueva característica en una parte específica del proyecto**
```console
feat(carrito de compras): agrega el botón increíble
```
### 1.1.2. feat eliminación
**Elimina una característica existente**
```console
feat!: eliminar el punto final de la lista de tickets
```
## 1.2. refers
**Agrega una referencia a una tarea o ticket**
```console
 refers to JIRA-1337 (se refiere a JIRA-1337)
```
## 1.3. fix
**Corrige un error en el código**
```console
fix: agregue el parámetro que falta a la llamada de servicio. El error se produjo debido a <razones>.
```
### 1.3.1. fix api
**Corrige un error específico en la API**
```console
fix(api): maneja el mensaje vacío en el cuerpo de la solicitud
fix(api): corrige el cálculo incorrecto de la suma de verificación del cuerpo de la solicitud
```
## 1.4. BREAKING CHANGES
**Indica cambios importantes que pueden romper la compatibilidad**
```console
BREAKING CHANGES: los puntos de ticket ya no admiten enumerar todas las entidades.
```
## 1.5. refactor
**Reestructura el código sin cambiar su comportamiento externo**
```console
refactor: implementar el cálculo del número de Fibonacci como recursividad
```
## 1.6. perf
**Mejora el rendimiento del código**
```console
perf: reduce el uso de memoria para determinar visitantes únicos mediante HyperLogLog
```
## 1.7. style
**Cambios que no afectan el significado del código (espacios en blanco, formato, punto y coma faltantes, etc.)**
```console
style: eliminar línea vacía
```
## 1.8. test
**Agrega pruebas faltantes o corrige pruebas existentes**
```console
test: agregar pruebas para la función de notificación
```
## 1.9. docs
**Cambios que afectan solo a la documentación**
```console
docs: actualizar la guía de instalación
```
## 1.10. build
**Cambios que afectan los componentes de compilación como la herramienta de compilación, la canalización CI, las dependencias, la versión del proyecto, etc.**
```console
build: actualizar dependencias
```
### 1.10.1. release
**Cambios relacionados con la liberación de una nueva versión del proyecto**
```console
build(release): `versión mejorada a 1.0.0
```
## 1.11. ops
**Cambios que afectan componentes operativos como infraestructura, implementación, respaldo, recuperación, etc.**
```console
ops: actualizar la configuración del servidor de producción
```
## 1.12. chore
**Tareas misceláneas que no se ajustan a las otras categorías**
```console
chore: modificando .gitignore
```
[<< INDICE](../README.md)