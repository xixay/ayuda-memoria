-- EMPRESA UNIPERSONAL
select 	* 
from 	controleg_persona.empresa_unipersonal eu 
where	true
--		and eu.empuni_codigo in (49)
--		and eu.perjur_codigo in (127)
--		and eu.pernat_codigo in (106)
order by eu.empuni_codigo desc;
--limit 16;
-- ENTIDADES
select 	* 
from 	controleg_persona.entidad e   
where	true 	
--		and e.ent_codigo in (1139)
order by e.ent_codigo  desc;
--limit 16;
-- PERSONA JURIDICA
select 	* 
from 	controleg_persona.persona_juridica pj  
where	true 	
--		and pj.perjur_codigo in (1)
--		and pj.perjur_nit like '54%'
--		and pj.perjur_sigla  like 'siga'
--		and pj.tpj_codigo in (1)
order by pj.perjur_codigo desc;
--limit 16;
-- PERSONA NATURAL
select 	* 
from 	controleg_persona.persona_natural pn  
where	true 	
--		and pn.pernat_codigo in (125)
		and pn.pernat_nombres like 'MIRIAM NICOLAZA'
order by pn.pernat_codigo  desc;
--limit 16;
-- PERSONA RESPONSABLE
select 	* 
from 	controleg_persona.persona_responsable pr  
where	true 	
--		and a.act_numero = '00.1601.110.2.24'
--		and a.act_codigo in (1121)
order by pr.perres_codigo desc 
limit 16;
-- REPRESENTANTE LEGAL
select 	* 
from 	controleg_persona.representante_legal rl 
where	true 	
--		and a.act_numero = '00.1601.110.2.24'
--		and a.act_codigo in (1121)
order by rl.repleg_codigo desc 
limit 16;












