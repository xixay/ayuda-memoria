GPA-GA2
	1799497	SANDRA QUIROGA SOLANO	SUPERVISOR 	EDICION
	3427342	JUAN JOSE PALACIOS NOGALES	APROBADOR 	EDICION
	2636570	MARIA ISABEL DURAN BORDA	FORMULADOR GERENTE 	EDICION
	2636570	MARIA ISABEL DURAN BORDA	FORMULADOR 	EDICION 
	
GDB

	4421594	JOSE ALEJANDRO SALVADOR ACHA	GERENTE CONSOLIDADOR 	EDICION
	5491571	JUAN PEREZ CALLEJAS	FORMULADOR 	EDICION
	5491571	JUAN PEREZ CALLEJAS	APROBADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
		SIN IDENTIFICAR	OFICIAL ADMINISTRATIVO 	EDICION 
GDB-GAD

	5491571	JUAN PEREZ CALLEJAS	FORMULADOR 	EDICION
	3403668	ANA MARIA BRIGGITTE DEL CARMEN ARRAZOLA DURAN	FORMULADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	5491571	JUAN PEREZ CALLEJAS	APROBADOR 	EDICION 

GDB-GAM
	2428708	SANTIAGO MAIDANA QUISPE	SUPERVISOR 	EDICION
	5491571	JUAN PEREZ CALLEJAS	APROBADOR 	EDICION
	1705123	MARY ANTONIA RIBERA ORTIZ	FORMULADOR 	EDICION
	1705123	MARY ANTONIA RIBERA ORTIZ	FORMULADOR GERENTE 	EDICION 

GDH
	4421594	JOSE ALEJANDRO SALVADOR ACHA	GERENTE CONSOLIDADOR 	EDICION
	4088924	MARY JHOANNA ACUÑA ANIBARRO	FORMULADOR 	EDICION
	4088924	MARY JHOANNA ACUÑA ANIBARRO	APROBADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	4096215	GEIDDY DEL CARMEN BARJA	OFICIAL ADMINISTRATIVO 	EDICION 
GDH-GSL

	5244166	FLADIMIR HUARACHI HUARACHI	FORMULADOR GERENTE 	EDICION
	5244166	FLADIMIR HUARACHI HUARACHI	FORMULADOR 	EDICION
	4374363	EDINO CLAUDIO CLAVIJO PONCE	SUPERVISOR 	EDICION
	4088924	MARY JHOANNA ACUÑA ANIBARRO	APROBADOR 	EDICION 


GDN 
	4874944	ERIKA CHAMBILLA HUANCA	FORMULADOR 	EDICION
	4874944	ERIKA CHAMBILLA HUANCA	APROBADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	9122793	JUAN CARLOS MAMANI QUISPE	OFICIAL ADMINISTRATIVO 	EDICION 
	
GDN-GAD	

	2389409	OLGA EDITH SUAREZ JIMENEZ	APROBADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	3813378	FRANKLIN SOLANO VARGAS	FORMULADOR 	EDICION 

GDP
	4421594	JOSE ALEJANDRO SALVADOR ACHA	GERENTE CONSOLIDADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	FORMULADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	APROBADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	6610404	PAOLA JIMENA LLANOS CHOQUE	OFICIAL ADMINISTRATIVO 
GDP-GSL	
		2389409	OLGA EDITH SUAREZ JIMENEZ	FORMULADOR 	EDICION
	8654053	CLAUDIA JIMENA CRUZ OTONDO	FORMULADOR GERENTE 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	APROBADOR 	EDICION 

GDP-GAD
	2389409	OLGA EDITH SUAREZ JIMENEZ	APROBADOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	SUPERVISOR 	EDICION
	2389409	OLGA EDITH SUAREZ JIMENEZ	FORMULADOR 	EDICION
	3703760	LUISA JEANNETTE CALBIMONTE ALIZARES	FORMULADOR GERENTE 	EDICION 
GDP-GAM

	3660415	JOSE LUIS SIVILA VARGAS	FORMULADOR 	EDICION
	3660415	JOSE LUIS SIVILA VARGAS	FORMULADOR GERENTE 	EDICION
	3660415	JOSE LUIS SIVILA VARGAS	SUPERVISOR 	EDICION
	3660415	JOSE LUIS SIVILA VARGAS	APROBADOR 	EDICION 
	
GDO-GAM
	3514306	RUBEN DARIO URIBE CABALLERO	FORMULADOR 	EDICION
	2428708	SANTIAGO MAIDANA QUISPE	APROBADOR 	EDICION
	3514306	RUBEN DARIO URIBE CABALLERO	FORMULADOR GERENTE 	EDICION
	2428708	SANTIAGO MAIDANA QUISPE	SUPERVISOR 	EDICION 
[7,7,0].forEach( e => [7,48].includes(e))

GC 



        if (this.cacCodigo == 2) {
          filterCacCodigo = '&cac_codigo=(2)'
          this.cacCodigoNoPlanificado = 4
        } else if (this.cacCodigo == 1) {
          if (this.tpoCodigoPoa== 1) {
            filterCacCodigo = '&cac_codigo=(1)'
          } else if (this.tpoCodigoPoa== 2) {
            filterCacCodigo = '&cac_codigo=(1,3)'
            this.cacCodigoNoPlanificado = 4
          }
        }

  @LoggerMethod
  async encuentraOrigen(pobjEstado: number) {
    let origen = 0;
    if (pobjEstado == EstadoPoa.EN_VERIFICACION) {
      origen = EstadoPoa.EDICION;
    } else if (pobjEstado == EstadoPoa.APROBADO) {
      origen = EstadoPoa.EN_VERIFICACION;
    } else if (pobjEstado == 7) {
      origen = 8;
    } else if (pobjEstado == 48) {
      origen = 7;
    } else if (pobjEstado == 17) {
      origen = 48;
    } else if (pobjEstado == 2) {
      origen = 17;
    }
    return origen;
  }
  


4421594
