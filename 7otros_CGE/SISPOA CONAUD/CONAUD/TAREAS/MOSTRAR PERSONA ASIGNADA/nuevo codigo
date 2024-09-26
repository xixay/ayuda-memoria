for (let item of arrayCargos) {
  // Inicializa valores por defecto
  item.nombre_persona_asignada = "";
  item.per_docidentidad = '';
  item.item_nombre_persona_asignada = 'ACÉFALO';
  item.per_asignado_nivel = '';

  if (item.per_codigo) {
    // Busca en arrayAsigCargosItem
    let personaEncontrada = arrayAsigCargosItem.find(persona => persona.per_codigo === item.per_codigo);

    // Si no se encuentra en arrayAsigCargosItem, busca en usuarioRetrieved o usuarioRetrievedCompleto
    if (!personaEncontrada) {
      personaEncontrada = usuarioRetrieved.find(f => f.per_codigo === item.per_codigo)
        || usuarioRetrievedCompleto.find(f => f.per_codigo === item.per_codigo);
    }

    // Si se encontró alguna persona, se actualizan los datos
    if (personaEncontrada) {
      const tipo = personaEncontrada.hasOwnProperty('persona_detalle') ? 1 : 2;
      item = await this.setDatosPersonas(tipo, item, personaEncontrada);
    }
  }
}

