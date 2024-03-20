--###  --- CARGOS ITEM MOVIMIENTOS - CARGOS QUE FUERON MOVIDOS A OTRAS AREAS UNIDADES
	select *from parametricas.tipos_movimientos tm 
	select * from estructura_organizacional.cargos_item_movimientos cim 
	;
--###  --- CARGOS ITEM PERSONA
	select cip.* from estructura_organizacional.cargos_items_persona cip where cip.cip_codigo in (126, 129) order by cip.cip_codigo asc
	select * from estructura_organizacional.cargos_items ci order by ci.cit_codigo desc -- 602
	select * from estructura_organizacional.cargos_items_persona cip order by cip.cip_codigo desc -- 587
	select cip.*
	from estructura_organizacional.areas_unidades au
			left join estructura_organizacional.cargos_items ci on au.aun_codigo = ci.aun_codigo
			left join estructura_organizacional.cargos_items_persona cip on ci.cit_codigo = cip.cit_codigo
	where au.org_codigo = 1
		and cip.cip_codigo is not null
		and cip.cip_estado = 2
	;