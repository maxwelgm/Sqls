--82757
-- descobrir o PAN, ou whatever, que se quer
select rpc.repc_sq_referencia_previsao
from   cprod.referencia_previsao_corrente rpc
where  rpc.repc_dt_referencia = to_date('01/01/2018', 'DD/MM/YYYY')
       and rpc.tmoc_cd_tipo_mov_corrente = 6
       and rpc.unop_cd_unid_oper = 191;

--92959
-- Descobrir o LOG ACAO, baca, para poder saber a hist caso não seja o CADASTRO frak FLUTUANTE
-- estou supondo que o ultimo larp e o ultimo valido, mas sendo SIPO, esse baca, tudo e possivel, sempre revalidar
-- ATENÇÃO!!! A PORCARIA ESTA COM A UO NO LUGAR DO TIPO E O TIPO NO LUGAR DA UO
  select max(larp.larp_sq_log_acao_ref_prev), larp.talg_cd_tipo_acao_log
        from   cprod.log_acao_ref_prev_corrente larp
        where  larp.repc_sq_referencia_previsao =
               (select rpc.repc_sq_referencia_previsao
                from   cprod.referencia_previsao_corrente rpc
                where  rpc.repc_dt_referencia =
                       to_date('01/01/2018', 'DD/MM/YYYY')
                       and rpc.tmoc_cd_tipo_mov_corrente = 6
                       and rpc.unop_cd_unid_oper = 191)
         group by larp.talg_cd_tipo_acao_log;
        

-- Tendo o Log Acao, vamos descobrir qual a historico

select *
from   cprod.hist_previsao_parada_producao hppp
where  hppp.larp_sq_log_acao_ref_prev =
       (select max(larp.larp_sq_log_acao_ref_prev)
        from   cprod.log_acao_ref_prev_corrente larp
        where  larp.repc_sq_referencia_previsao =
               (select rpc.repc_sq_referencia_previsao
                from   cprod.referencia_previsao_corrente rpc
                where  rpc.repc_dt_referencia =
                       to_date('01/01/2018', 'DD/MM/YYYY')
                       and rpc.tmoc_cd_tipo_mov_corrente = 6
                       and rpc.unop_cd_unid_oper = 191))
order  by hppp.pprp_dt_inicio_prev;

---- Lista Final dos REs sem os bacas todos
select * 
from   cprod.hist_previsao_parada_producao hppp
left join cprod.log_acao_ref_prev_corrente larp on larp.larp_sq_log_acao_ref_prev = hppp.larp_sq_log_acao_ref_prev
   left join cprod.referencia_previsao_corrente repc on repc.repc_sq_referencia_previsao = larp.repc_sq_referencia_previsao
where repc.repc_dt_referencia = to_date('01/01/2018', 'DD/MM/YYYY')
       and repc.tmoc_cd_tipo_mov_corrente = 6
       and repc.unop_cd_unid_oper = 191
       --and to_number(to_char(hppp.pprp_dt_inicio_prev, 'YYYY')) <= 2018 and to_number(to_char(hppp.pprp_dt_fim_prev, 'YYYY')) >= 2018
order by  hppp.pprp_dt_inicio_prev;




