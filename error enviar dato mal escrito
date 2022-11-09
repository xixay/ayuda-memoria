# Errores
- Sale en terminal
```console
[09/11/2022 14:49:16] ERROR (HttpExceptionFilter): {
  errorResponse: {
    finalizado: false,
    codigo: 500,
    timestamp: 1668019756,
    mensaje: 'Ocurrió un error interno.',
    datos: {
      errores: [
        'QueryFailedError: new row for relation "puertos" violates check constraint "CHK_d84aba38fa9e80c62029f915b5"'
      ]
    }
  }
}

```
- Ir a puertos/ṕropiedades/Restricciones buscar "CHK_d84aba38fa9e80c62029f915b5"
```txt
Tiene como atributo al (_estado)
```
- Copiar el insert de la terminal
```sql
INSERT INTO
  "openvox"."puertos" (
    "_estado",
    "_transaccion",
    "_usuario_creacion",
    "_fecha_creacion",
    "_usuario_modificacion",
    "_fecha_modificacion",
    "codigo",
    "propiedades",
    "id_openvox"
  )
VALUES
  (
    'UNKNOW',
    'CREAR',
    '2',
    '2022-11-09T18:49:15.947Z',
    DEFAULT,
    DEFAULT,
    1,
    '{"port":1,"d-channel":"2","status":"Power on, Provisioned, No Signal, Active, Standard","type":"CPE","manufacturer":"Revision: MTK 0828","model_name":"Quectel_M35","model_imei":"869969034653390","revision":"M35FAR02A13","operator":"","register":"Not registered","signal":"-1","ber":"-1","sim_imsi":"460014359901147","sim_sms_center_number":"","own_number":"","remain_time":"No Limit","pdd":"0","asr":"0","acd":"0","last_event":"Unknown Event","state":"UNKNOW","limit":"None","last_send_at":"","show_status":"","band":"","day_remain_calls":"0","d_channel":"2"}',
    '21'
  )
```
- Esta enviando mal desde el frontend
```
ERA=UNKNOWN
ESTA=UNKNOW
```
- Conclusion el insert estaba fallando
