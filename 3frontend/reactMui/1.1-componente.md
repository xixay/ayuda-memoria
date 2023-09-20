## Componente
- Crear la carpeta componente con 2 archivos: index.ts, Hero.tsx
### Hero.tsx
```tsx
import React from 'react'
const Hero = () => {
    return (
        <div>Heros</div>
    )
}
export default Hero
```
### index.ts
```ts
import Hero from './Hero';
export {
    Hero
}
```
- Llamarlo desde la aplicación principal
### page.tsx
```tsx

import { Hero } from '@/components'

export default function Home() {
  return (
    <main>
      <Hero/>
    </main>
  )
}

```