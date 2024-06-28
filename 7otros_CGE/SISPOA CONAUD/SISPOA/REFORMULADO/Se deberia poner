 else if (resultActividadesAuxiliar.length == 0){
        try {
          console.log("🐱==kk1p==> ~ getActividadesDto:", getActividadesDto)
          delete getActividadesDto.act_estado;
          resultActividadesAuxiliar = await this.findAll(getActividadesDto, manager);
          console.log("🐱==kk2p==> ~ resultActividadesAuxiliar:", resultActividadesAuxiliar)
        } catch (error) { }
        if (resultActividadesAuxiliar.length > 0) {
          resultActividadesAuxiliar
          const swVerif8 = resultActividadesAuxiliar.some(item => item.act_estado == 3);
          const swVerif7 = resultActividadesAuxiliar.some(item => item.act_estado == 8);
          let cambio = 0;
          if (swVerif8) {
            cambio = 8
          }
          if (swVerif7) {
            cambio = 7
          }
          for (const item of resultActividadesAuxiliar) {
            console.log("🐱==kk ppp==> ~ item:", item)
            const updateActividadesDto = new UpdateStateActividadesDto();
            updateActividadesDto.act_codigo = item.act_codigo;
            updateActividadesDto.act_estado = cambio;
            updateActividadesDto.usuario = updateActividadesGroupDto.usuario;
            await this.updateStatus(updateActividadesDto, manager);
          }
        }
      }
