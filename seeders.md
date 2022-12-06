# Realizado de seeders proyecto base AGETIC nestjs
- Ir a  a la ubicación database/seeds/
- Crear el archivo 1611498173796-openvox.ts (debe tener un nuemro de codigo diferente a los otros)
```ts
// Llama a la entidad
import { Openvox } from '../../src/application/openvox/entity/openvox.entity'
import { MigrationInterface, QueryRunner } from 'typeorm'

export class openvox1611498173796 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    // En los atributos no se coloca (id, estado, transaccion, usuarioCreacion, fechaCreacion)
    const items = [
      {
        // id: '1',
        modelo: 'OPENVOXAPI',
        ip: '192.168.20.201',
        https: true,
        puerto: 443,
        usuario: 'yo123',
        contrasena: 'U2FsdGVkX18TFtLm4bzvjPoMRmbYt1U5EdXzsw+snPo=',
        puerto_asterisk: 5038,
        usuario_asterisk: 'admin',
        contrasena_asterisk: 'U2FsdGVkX18KjhheV1RQQHj0syHa7nabLODn42uc4ck='
      },
      {
        // id: '2',
        modelo: 'OPENVOXdemo',
        ip: 'demo.openvox.cn',
        https: false,
        puerto: 65321,
        usuario: 'tu123',
        contrasena: 'U2FsdGVkX18J0YxdFu7Ybwv/XDdrgheq9l5x3yjlKMg=',
        puerto_asterisk: 5439,
        usuario_asterisk: 'tu123ASK',
        contrasena_asterisk: 'U2FsdGVkX18J0YxdFu7Ybwv/XDdrgheq9l5x3yjlKMg='
      },
      {
        // id: '3',
        modelo: 'OPENVOXSIN',
        ip: '192.168.0.12',
        https:false,
        puerto:441,
        usuario:'ellos123',
        contrasena:'U2FsdGVkX1+T746X71Th6VZ52DfxWiDf0pqitL3rt/g=',
        puerto_asterisk:440,
        usuario_asterisk:'ellosASK123',
        contrasena_asterisk:'U2FsdGVkX1948aHUBbYHMkwCteZ4PdGdRX5t4g/pSbU='
      },
    ]
    const openvoxes = items.map((item) => {
      return new Openvox({
        // declarar los atributos mencionados arriba
        modelo: item.modelo,
        ip: item.ip,
        https: item.https,
        puerto: item.puerto,
        usuario: item.usuario,
        contrasena: item.contrasena,
        puertoAsterisk: item.puerto_asterisk,
        usuarioAsterisk: item.usuario_asterisk,
        contrasenaAsterisk: item.contrasena_asterisk,
        // declarar estos atributos por defecto(para todos es igual)
        estado: 'ACTIVO',
        transaccion: 'SEEDS',
        usuarioCreacion: '1',
        fechaCreacion: new Date(),
      })
    })
    await queryRunner.manager.save(openvoxes)
  }

  /* eslint-disable */
  public async down(queryRunner: QueryRunner): Promise<void> {}
}
```
```txt
El nombre de la clase (openvox1611498173796), debe ser similar al nombre del archivo(1611498173796-openvox.ts)
```
- Ejecutar npm run setup
