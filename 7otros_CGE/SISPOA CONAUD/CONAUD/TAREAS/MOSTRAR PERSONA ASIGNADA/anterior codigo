Estoy usando nestjs, en un fragmento de mi codigo:
      for (let item of arrayCargos) {
        item.nombre_persona_asignada = ""
        item.per_docidentidad = '';
        item.item_nombre_persona_asignada = 'ACÉFALO'
        item.per_asignado_nivel = '';
        if (item.per_codigo) {
          let asig_cargo_item = null;
          asig_cargo_item = arrayAsigCargosItem.find(persona => persona.per_codigo == item.per_codigo);
          if (asig_cargo_item) {
            item = await this.setDatosPersonas(1, item, asig_cargo_item);
          } else {
            let per_nombre_responsable = null;
            per_nombre_responsable = usuarioRetrieved.find(f => f.per_codigo == item.per_codigo)
            if (per_nombre_responsable) {
              item = await this.setDatosPersonas(2, item, per_nombre_responsable);
            } else {
              per_nombre_responsable = usuarioRetrievedCompleto.find(f => f.per_codigo == item.per_codigo)
              if (per_nombre_responsable) {
                item = await this.setDatosPersonas(2, item, per_nombre_responsable);
              }
            }
          }
        }
      }
      
quisiera reducir los if, se puede?
