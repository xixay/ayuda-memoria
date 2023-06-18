## Generar Crud
- Estando en el esquema parametricas
```console
npx ts-node src/common/scripts/feature.generator.ts TipoAreasUnidades parametricas
```
- Estando en el esquema estructura_organizacional
```console
npx ts-node src/common/scripts/feature.generator.ts Items estructura_organizacional
```
- Si aparece  null value in column id'' violates not-null constraint, es porque en el validation en el insert colocar
```ts
estados.est_codigo = 1;
objetivosEstrategicos2.oes_estado = estados;//por ser objeto
```
- Ó Colocar Por defecto value =1(en la base de datos)
