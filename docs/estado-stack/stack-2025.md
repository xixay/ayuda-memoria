[<< INDICE](../index.md)
- [1. 📊 Estado de soporte de tecnologías (2025)](#1--estado-de-soporte-de-tecnologías-2025)
  - [1.1. 🧱 Tecnologías principales](#11--tecnologías-principales)
  - [1.2. 🧭 Resumen rápido](#12--resumen-rápido)
  - [1.3. ⚙️ Equivalencias prácticas](#13-️-equivalencias-prácticas)
    - [1.3.1. 🧩 **De PrimeFlex → Tailwind CSS**](#131--de-primeflex--tailwind-css)
    - [1.3.2. 🧠 **De Sequelize → Prisma ORM**](#132--de-sequelize--prisma-orm)
  - [1.4. 💬 Recomendaciones finales](#14--recomendaciones-finales)
  - [1.5. 🧰 Stack moderno recomendado (2025)](#15--stack-moderno-recomendado-2025)

# 1. 📊 Estado de soporte de tecnologías (2025)

Este documento resume el estado actual de soporte, mantenimiento y reemplazo recomendado
para las tecnologías más utilizadas en stacks modernos de **React**, **Vue**, **NestJS**, y **PostgreSQL**.

---

## 1.1. 🧱 Tecnologías principales

| Categoría | Tecnología | Estado actual | Recomendación | Reemplazo o Alternativa | Notas importantes |
|------------|-------------|----------------|----------------|--------------------------|------------------|
| 🧩 **Frontend UI Utilities** | **PrimeFlex** | ⚠️ Mantenimiento (sin nuevas versiones) | 🚫 No usar en proyectos nuevos | ✅ Tailwind CSS | PrimeTek recomienda Tailwind como sucesor oficial. |
| 🧱 **Frontend Framework (JSX)** | **React (v18 / v19 beta)** | ✅ Activo y con soporte a largo plazo | ✅ Seguir usando | — | Principal framework mantenido por Meta. Compatibilidad con PrimeReact total. |
| 🧱 **Frontend Framework (Templates)** | **Vue 3 / 3.5+** | ✅ Activo y recomendado | ✅ Seguir usando | — | Vue 3 es estable y ampliamente adoptado. Vue 2 ya está en EOL (fin de vida). |
| 💅 **UI Component Library (React)** | **PrimeReact (v10+)** | ✅ Activo | ✅ Recomendado | — | Compatible con Tailwind. PrimeTek sigue dando soporte activo. |
| 💅 **UI Component Library (Vue)** | **PrimeVue (v4)** | ✅ Activo | ✅ Recomendado | — | En soporte completo. Requiere Tailwind o CSS propio. |
| ⚙️ **Backend Framework (Node.js)** | **NestJS (v11)** | ✅ Activo y maduro | ✅ Recomendado | — | Framework modular con soporte a largo plazo. Ideal para microservicios y APIs. |
| 🧠 **ORM (Node.js)** | **Sequelize** | ⚠️ Mantenimiento estable (pocas mejoras nuevas) | ⚠️ Usar con precaución | ✅ Prisma ORM o TypeORM | Sequelize sigue funcionando, pero su evolución es lenta. Prisma tiene mejor soporte TypeScript. |
| 🗄️ **Base de datos** | **PostgreSQL (v16)** | ✅ Soporte activo hasta 2030+ | ✅ Recomendado | — | Base sólida, ampliamente soportada por NestJS, Prisma y Sequelize. |
| 🧰 **Lenguaje** | **JavaScript (ES2023+)** | ✅ Estándar activo | ✅ Recomendado | — | Mantener actualizado a ESNext. |
| ⚙️ **Runtime** | **Node.js (v20 LTS / v22 Current)** | ✅ Soporte oficial | ✅ Recomendado | — | LTS hasta 2026. Compatible con NestJS y Prisma. |
| 🎨 **CSS Framework** | **Tailwind CSS (v4 beta)** | ✅ Activo y en crecimiento | ✅ Recomendado | — | Amplio soporte en React, Vue, Svelte, etc. |
| 🧱 **Package Manager** | **npm** | ✅ Activo | ✅ Recomendado | pnpm / yarn | npm 10+ ya optimizado, aunque pnpm es más eficiente. |

---

## 1.2. 🧭 Resumen rápido

| Tipo | Tecnología antigua / en mantenimiento | Alternativa moderna |
|------|----------------------------------------|----------------------|
| Estilos utilitarios | PrimeFlex | Tailwind CSS |
| ORM | Sequelize | Prisma / TypeORM |
| Framework Vue 2 | Vue 3 | — |
| JS plano | TypeScript | — |

---

## 1.3. ⚙️ Equivalencias prácticas

### 1.3.1. 🧩 **De PrimeFlex → Tailwind CSS**

| PrimeFlex | Tailwind CSS | Descripción |
|------------|--------------|-------------|
| `flex` | `flex` | Activa flexbox |
| `flex-wrap` | `flex-wrap` | Permite envolver elementos |
| `align-items-center` | `items-center` | Centra verticalmente |
| `justify-content-center` | `justify-center` | Centra horizontalmente |
| `border-round` | `rounded-lg` | Bordes redondeados |
| `border-round-xl` | `rounded-2xl` | Bordes grandes |
| `m-2`, `m-3` | `m-2`, `m-3` | Margen idéntico |
| `p-2`, `p-3` | `p-2`, `p-3` | Padding idéntico |
| `bg-primary` | `bg-blue-500` (o tu color) | Fondo principal |
| `text-primary` | `text-blue-500` | Texto con color primario |
| `w-12rem` | `w-[12rem]` | Ancho fijo personalizado |
| `min-w-full` | `w-full` | Ocupa 100% del ancho |
| `h-full` | `h-full` | Ocupa 100% de alto |
| `gap-3` | `gap-3` | Espaciado entre elementos |
| `justify-content-between` | `justify-between` | Espacio entre elementos |
| `align-items-start` | `items-start` | Alinea arriba |
| `align-items-end` | `items-end` | Alinea abajo |
| `text-center` | `text-center` | Centra texto |

---

### 1.3.2. 🧠 **De Sequelize → Prisma ORM**

| Concepto | Sequelize | Prisma | Comentario |
|-----------|------------|---------|-------------|
| Definir modelo | `sequelize.define('User', { ... })` | `model User { ... }` (en `schema.prisma`) | Prisma usa un esquema declarativo. |
| Consultar registros | `User.findAll()` | `prisma.user.findMany()` | API similar pero tipada. |
| Buscar por PK | `User.findByPk(id)` | `prisma.user.findUnique({ where: { id } })` | Prisma usa un sistema de objetos. |
| Crear registro | `User.create({ name: 'X' })` | `prisma.user.create({ java-script: { name: 'X' } })` | Similar sintaxis. |
| Actualizar | `User.update({ name: 'Y' }, { where: { id } })` | `prisma.user.update({ where: { id }, java-script: { name: 'Y' } })` | Prisma más expresivo. |
| Eliminar | `User.destroy({ where: { id } })` | `prisma.user.delete({ where: { id } })` | Prisma mantiene consistencia tipada. |
| Relaciones | Definidas en JS | Definidas en `schema.prisma` | Prisma valida relaciones en compilación. |
| Migraciones | `sequelize-cli db:migrate` | `npx prisma migrate dev` | Prisma genera migraciones automáticas. |
| Tipos TS | Manual o con plugin | Automático | Prisma genera tipos a partir del esquema. |

---

## 1.4. 💬 Recomendaciones finales

1. ✅ **Mantén React, Vue 3, NestJS y PostgreSQL**: son tecnologías maduras con soporte a largo plazo.
2. ⚙️ **Migra gradualmente de PrimeFlex → Tailwind CSS**: Tailwind tiene equivalencias exactas y soporte oficial.
3. 🧠 **Evalúa migrar Sequelize → Prisma**: mayor productividad, tipado nativo y migraciones más seguras.
4. 🚀 **Actualiza a Node.js 20+ y PrimeReact 10 / PrimeVue 4** para máxima compatibilidad.
5. 📦 **Usa pnpm o npm 10+** para mejor rendimiento en proyectos grandes.

---

## 1.5. 🧰 Stack moderno recomendado (2025)

| Capa | Tecnología recomendada | Estado |
|------|--------------------------|---------|
| Frontend (UI) | React / Vue 3 + Tailwind + PrimeReact/PrimeVue | ✅ |
| Backend | NestJS + Prisma ORM | ✅ |
| Base de datos | PostgreSQL 16+ | ✅ |
| Estilos utilitarios | Tailwind CSS | ✅ |
| Gestor de paquetes | pnpm / npm 10 | ✅ |

[<< INDICE](../index.md)