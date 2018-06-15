-- Lista da E4 não aprovada ainda - não foi para a Hist
select * 
from CPROD.REFERENCIA_PREVISAO_CORRENTE r
inner join cprod.previsao_volume_corrente pvc on pvc.repc_sq_referencia_previsao = r.repc_sq_referencia_previsao
inner join cprod.curva_corrente_unid_operativa ccuo on pvc.ccuo_sq_corrente_unidade = ccuo.ccuo_sq_corrente_unidade
   inner join cprod.curva_corrente cuco on ccuo.cuco_sq_curva_corrente = cuco.cuco_sq_curva_corrente
      inner join cprod.corrente_fisica_escoamento cfie on cuco.cfie_sq_corrente = cfie.cfie_sq_corrente
      inner join cprod.curva cu on cuco.curv_cd_curv = cu.curv_cd_curv
      left join eep.fluido flui on cu.flui_cd_fluido = flui.flui_cd_fluido
where r.tmoc_cd_tipo_mov_corrente = 4 
and r.repc_dt_referencia = '07/03/2017' 
--and r.repc_dt_referencia = '25/07/2017' 
--and r.unop_cd_unid_oper = 120
--and pvc.prvc_vl_previsto is null
and cuco.curv_cd_curv = 1
and cfie.cfie_sq_corrente = 1900
order by cfie.cfie_ds_corrente, cu.ccur_cd_classificacao_curva, cu.curv_nr_ordenacao
