      async migratePoa () {
        if (this.gesCodigo !== 0) {
          this.dialogMigrateActionLoading = true
          await this.$service.get(
            'SISPOA',
            `${this.componentServicePath}/migrar?ges_codigo=${this.gesCodigo}`
          ).then(response => {
            if (response) {
              this.$toast.success(response.err_mensaje)
              this.poaCodigoSelected = 0
              this.getAllPoas()
              this.closeModalMigratePoa()
            }
          }).catch(error => {
            this.$toast.info(error.error_mensaje)
          }).finally(() => {
            this.dialogMigrateActionLoading = false
          })
        } else {
          this.$toast.info('Ninguna gestión seleccionada')
        }
      },
      
-CREATE NEW POA
-this.poasObjetivosService.migratePoaObjetivoWithPoaCodigo
	-CREATE NEW POA OBJETIVO
	-this.objetivosAreaUnidadService.migrateObjetivoAreaUnidadWithPobjCodigo
		-CREATE NEW OBJETIVO AREA UNIDAD
	-this.actividadesService.migrateActividadWithFobCodigo (cac_codigo=1,3)
		-CREATE NEWS ACTIVIDAD
		-BUSCA SI TIENE EN EJECUCIÓN EN INICIO ACT POA, INF UAI, INICIOS ADM
		-this.actividadesViaticosService.migrateActividadViaticoWithActCodigo
			- CREATE NEW ACTIVIDAD VIATICO
	-this.actividadesService.migrateActividadWithFobCodigo (cac_codigo=2)
		-todo lo mismo que arriba
-this.areaUnidadResponsablesService.migrateAreaUnidadResponsablesWithPoaCodigo
	-CREATE NEWS AREA-UNIDAD-RESPONSABLES
	
poa_codigo_anterior=2
poa_codigo_nuevo=4
	
	
	
	
	

