## Curl
```
curl 'http://172.16.22.232:7008/inicio-evaluacion-informe' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Accept-Language: es-419,es;q=0.9' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjoxNjQzLCJzaXN0ZW1hcyI6W3sic2lzY2dlX2NvZGlnbyI6MzQsInNpc2NnZV9zaWdsYSI6InNpc3BvYSJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInNpc2NnZV9zaWdsYSI6ImNvbmF1ZCJ9XSwicm9sZXMiOlt7InNpc2NnZV9jb2RpZ28iOjM0LCJyb2xfY29kaWdvIjoxOTAsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMDgsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifV0sImlkIjoiYWMzNDk3YTEtYmM1Yi00MTFkLTgzMGItYTkyODYyNTkzY2NiIiwidGlwbyI6InVzdWFyaW8iLCJpYXQiOjE3MzM0MzgzMDIsImV4cCI6MTczMzQ2NzEwMiwibW9tZW50IjoiMjAyNC0xMi0wNVQxODozODoyMi0wNDowMCJ9.Owiflu5Mh5XzO2Gu2lhD1m5E38pwEF54DGAGEYRvbJnXycosyLn7HmTgW2msxO2EDnVXIgcl67urzf-hZyk1cg' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Origin: http://172.16.22.232:3002' \
  -H 'Referer: http://172.16.22.232:3002/' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' \
  --data-raw '{"per_codigo_gerente":1914,"per_codigo_responsable":1643,"iua_fecha_inicio_evaluacion":"2024-12-12T04:00:00.000Z","iua_fecha_fin_evaluacion":"2024-12-12T04:00:00.000Z","iei_descripcion":"prueba","iei_objeto":"prueba","iei_objetivo":"prueba","iei_alcance":"prueba","iei_oficina_central":1,"iei_observaciones":"prueba","iua_codigo":1537,"iua_codigo_control":"UAIKK/R"}' \
  --insecure
```
## Carga Util
```json
CreateInicioEvaluacionInformeDto {  
	per_codigo_gerente: 1016,  
	per_codigo_responsable: 216,  
	iua_fecha_inicio_evaluacion: '2024-12-04T04:00:00.000Z',  
	iua_fecha_fin_evaluacion: '2024-12-05T04:00:00.000Z',  
	iei_descripcion: 'dsda',  
	iei_objeto: 'dsadas',  
	iei_objetivo: 'dasdas',  
	iei_alcance: 'dsadsa',  
	iei_oficina_central: 1,  
	iei_observaciones: 'dsadasdsa',  
	iua_codigo: 1474,  
	iua_codigo_control: 'UAIEC/T',  
	usuario: 216  
}
```
## Servicio
- src/feature/informes-uai/service/create-informes-uai.service.ts
## Funcion
- deconsolidateInformesUai
## Roles

| _list_ | Doc. Identidad | Nombre Completo                               | Rol                | Estado  |
| ------ | -------------- | --------------------------------------------- | ------------------ | ------- |
|        | 3403668        | ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN | FORMULADOR         | EDICION |
|        | 2389409        | OLGA EDITH SUAREZ JIMENEZ                     | SUPERVISOR         | EDICION |
|        | 4385501        | JULIO CARLOS GUERRA VILLARROEL                | APROBADOR          | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR GERENTE | EDICION |
|        | 1397469        | RUTH TARCAYA GALLARDO                         | FORMULADOR         | EDICION |

## Bases
### antes de iniciar backup_20241205_213523.sql

| iua_codigo | iua_codigo_control | ttr_codigo | ttr_codigo | ttr_sigla | ttr_descripcion      | act_codigo | act_numero       | aun_codigo_ejecutora | aun_sigla |
| ---------- | ------------------ | ---------- | ---------- | --------- | -------------------- | ---------- | ---------------- | -------------------- | --------- |
| 1474       |                    | 77         | 77         | EVFIRM    | EVALUACIÓN DE FIRMAS | 2281       | 520.1302.63.1.24 | 18                   | GDC-GAD   |
### http://192.168.0.13:3002/conaud/inicio-evaluacion-informe?act_codigo=2281&iua_codigo=1474

## Modificado Funcion
```ts
  @LoggerMethod
  async create(createInicioEvaluacionInformeDto: CreateInicioEvaluacionInformeDto, manager: EntityManager) {
    console.log("🐱==xx1==>  CreateInicioEvaluacionInformeService  createInicioEvaluacionInformeDto:", createInicioEvaluacionInformeDto)
    const iua_fecha_inicio_evaluacion = createInicioEvaluacionInformeDto.iua_fecha_inicio_evaluacion;
    const iua_fecha_fin_evaluacion = createInicioEvaluacionInformeDto.iua_fecha_fin_evaluacion;
    let iua_codigo_control = createInicioEvaluacionInformeDto.iua_codigo_control;
    const is_ampliacion = createInicioEvaluacionInformeDto.is_ampliacion;
    try {
      const inicioEvaluacionInforme: InicioEvaluacionInforme = await this.validationsInicioEvaluacion(manager, createInicioEvaluacionInformeDto);
      console.log("🐱==xx2==>  CreateInicioEvaluacionInformeService  inicioEvaluacionInforme:", inicioEvaluacionInforme)
      const sql = 'SELECT COALESCE(MAX(inicio_evaluacion_informe.iei_codigo), 0) + 1 codigo FROM ejecucion_informes.inicio_evaluacion_informe;';
      const codeResult: any = await manager.query(sql);
      inicioEvaluacionInforme.iei_codigo = codeResult[0].codigo;
      let resultQuery = null;
      let resultQueryInformesUai = null;
      let resultQueryInformesUaiUpdate = null;
      let resultQueryAsignaciones = null;
      let resultQueryInicioEvaluacionInformeAsignaciones = null;
      try {
        resultQuery = await manager.save(inicioEvaluacionInforme);
      } catch (error) {
        throwError(400, 'ERROR EN CREACION DE INICIO EVALUACION INFORME');
      }
      //create all if not is ampliacion
      if (!is_ampliacion) {
        try {
          const getAllInformesUaiDto: GetAllInformesUaiDto = new GetAllInformesUaiDto();
          getAllInformesUaiDto.iua_codigo = `(${createInicioEvaluacionInformeDto.iua_codigo.toString()})`;
          resultQueryInformesUai = await this.informesUaiServicesFacade.findAllInformesUAI(getAllInformesUaiDto, manager);
          console.log("🐱==xx3==>  CreateInicioEvaluacionInformeService  resultQueryInformesUai:", resultQueryInformesUai)
          resultQueryInformesUai[0].iua_fecha_inicio_evaluacion = iua_fecha_inicio_evaluacion;
          resultQueryInformesUai[0].iua_fecha_fin_evaluacion = iua_fecha_fin_evaluacion;
          if ([77, 18].includes(resultQueryInformesUai[0].ttr_codigo)) {
            console.log('essssssssss')

            // Verificar si la cadena contiene "UAI"
            if (iua_codigo_control.includes("UAI")) {
              // Eliminar "UAI" de la cadena
              iua_codigo_control = iua_codigo_control.replace("UAI", "");
            }
          }
          resultQueryInformesUai[0].iua_codigo_control = iua_codigo_control;
          console.log("🐱==xx4==>  CreateInicioEvaluacionInformeService  resultQueryInformesUai[0]:", resultQueryInformesUai[0])
          resultQueryInformesUaiUpdate = await this.informesUaiServicesFacade.update(resultQueryInformesUai[0], manager);
        } catch (error) {
          throwError(400, 'ERROR UPDATE INFORME UAI');
        }
        try {
          const createAsignacionesDto: CreateAsignacionesDto = new CreateAsignacionesDto();
          createAsignacionesDto.asi_descripcion = 'Asignacion Inicio Evaluacion' + inicioEvaluacionInforme.iei_codigo;
          createAsignacionesDto.usuario = inicioEvaluacionInforme.usuario_registro;
          resultQueryAsignaciones = await this.asignacionesServicesFacade.create(createAsignacionesDto, manager);
        } catch (error) {
          throwError(400, 'ERROR CREACION ASIGNACIONES');
        }
        try {
          const createInicioEvaluacionInformeAsignacionesDto: CreateInicioEvaluacionInformeAsignacionesDto = new CreateInicioEvaluacionInformeAsignacionesDto();
          createInicioEvaluacionInformeAsignacionesDto.asi_codigo = resultQueryAsignaciones.asi_codigo;
          createInicioEvaluacionInformeAsignacionesDto.iei_codigo = resultQuery.iei_codigo;
          createInicioEvaluacionInformeAsignacionesDto.usuario = inicioEvaluacionInforme.usuario_registro;
          resultQueryInicioEvaluacionInformeAsignaciones = await this.createAsignacionInicioEvaluacion(createInicioEvaluacionInformeAsignacionesDto, manager);
        } catch (error) {
          throwError(400, 'ERROR EN CREACIÓN DE INICIO EVALUACION ASIGNACIONES');
        }
        try {
          const createAsignacionesDefault = new CreateByAsignacionesDto();
          createAsignacionesDefault.asi_codigo = resultQueryAsignaciones.asi_codigo;
          createAsignacionesDefault.usuario = inicioEvaluacionInforme.usuario_registro;
          await this.asignacionesCargosItemServicesFacade.createToEvaluaciones(createAsignacionesDefault, manager);
        } catch (error) {
          throwError(400, 'ERROR EN CREACIÓN DE RESPONSABLE ASIGNACIONES CARGOS ITEM');
        }
      }

      return CustomService.verifyingDataResult(resultQuery, this.message_custom);
    } catch (error) {
      this.logger.debug(error);
      throwError(400, error.message);
    }
  }
```