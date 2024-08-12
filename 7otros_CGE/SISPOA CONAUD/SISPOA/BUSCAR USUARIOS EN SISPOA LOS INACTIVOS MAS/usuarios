      async getAllDatosUsuarios () {
        await this.$service.get('SISPOA', `_autenticacion/usuarios_completo`).then(response => {
          if (response) {
            console.log("🐱==kk1==> ~ response:", response)
            this.ArrayUsuarios = response
          }
        }).catch(error => {
          this.ArrayUsuarios = []
        })
      },
