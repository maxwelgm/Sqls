select ipc.camp_cd_campo               "Código",
       c.camp_nm_campo                 "Campo",
       b.bloc_cd_bloco                 "Cod. Bloco",
       b.bloc_nm_bloco                 "Nome Bloco",
       ipc.inpa_cd_ambi                "Ambiente ANP", --CMPC_IN_AMBIENTE_ANP
       ipc.inpa_cd_campo_anp           "Cód. ANP",
       ipc.inpa_md_pod_calor_oil       "PCS do Óleo",
       ipc.inpa_dt_inicio_prod         "Data Início Produção",
       ipc.inpa_cd_ambi_pe             "Ambiente para PE", -- CMPC_IN_AMBIENTE_PE
       act.atct_sg_ativo               "Ativo CBI",
       ipc.inpa_pr_part                "% Part. Tributaria Padrão",
       ipc.inpa_pr_dir_prod            "% Part. Tributaria Dif",
       ipc.coes_cd_corrente            "Cód. Corrente Escoamento ANP",
       ipc.Inpa_In_Agrupamento_Campo   "Agrupar no BMM",       
       ipc.inpa_sg_campo               "Sigla Alternativa",
       c.camp_sg_campo                 "Sigla",       
       ipc.unop_cd_unid_oper           "UO Alternativa",
       c.unop_cd_unid_oper             "UO",       
       sta.stca_nm_campo               "Status Alternativo",
       st.stca_nm_campo                "Status",       
       ipc.inpa_nr_contr_conc          "Nº do Contrato Alternativo",
       cc.VCCP_NR_CONTR_CONC           "Nº do Contrato",       
       ipc.inpa_dt_contrato            "Data de Contrato Alternativo",
       cc.vccp_dt_assinatura           "Data de Contrato",       
       ipc.unfe_cd_uf                  "UF Alternativa",
       LISTAGG(bu.unfe_cd_uf, ', ') within group(order by bu.unfe_cd_uf) "UF"

from   cprod.info_part_campo ipc,
       rst.campo c,
       aco.bloco b,
       aco.bloco_uf bu,
       rst.status_campo sta,
       rst.status_campo st,
       cprod.ativo_cbi_tributario act,
       (select distinct v.VCCP_CD_BLOCO,
                        v.VCCP_CD_CONTR_CONC,
                        v.VCCP_NR_CONTR_CONC,
                        v.VCCP_PR_ROYALTIES,
                        v.VCCP_DT_ASSINATURA
        from   cprod.vw_contrato_concessao_parceria v) cc
where  ipc.camp_cd_campo = c.camp_cd_campo
       and act.atct_sq_cbi = ipc.atct_sq_cbi
       and ipc.stca_cd_campo = sta.stca_cd_campo(+)
       and c.stca_cd_campo = st.stca_cd_campo(+)
       and b.bloc_cd_bloco = c.bloc_cd_bloco
       and b.ccon_cd_contr_conc = cc.vccp_cd_contr_conc(+)
       and cc.vccp_cd_bloco = c.bloc_cd_bloco
       and b.bloc_cd_bloco = bu.bloc_cd_bloco

group  by ipc.camp_cd_campo,
          c.camp_nm_campo,
          b.bloc_cd_bloco,
          b.bloc_sg_bloco,
          b.bloc_nm_bloco,
          ipc.inpa_cd_ambi,
          ipc.inpa_cd_campo_anp,
          ipc.inpa_md_pod_calor_oil,
          ipc.inpa_dt_inicio_prod,
          ipc.inpa_cd_ambi_pe,
          ipc.atct_sq_cbi,
          act.atct_sg_ativo,
          ipc.inpa_pr_part,
          ipc.inpa_pr_dir_prod,
          ipc.coes_cd_corrente,
          ipc.Inpa_In_Agrupamento_Campo,
          ipc.inpa_sg_campo,
          c.camp_sg_campo,
          ipc.unop_cd_unid_oper,
          c.unop_cd_unid_oper,
          ipc.stca_cd_campo,
          c.stca_cd_campo,
          sta.stca_nm_campo,
          st.stca_nm_campo,
          ipc.inpa_nr_contr_conc,
          cc.VCCP_NR_CONTR_CONC,
          ipc.inpa_dt_contrato,
          cc.vccp_dt_assinatura,
          ipc.pais_cd_pais,
          ipc.unfe_cd_uf;
          
/*select * from ativo a where a.ativ_in_ativo = 'S';
select * from ativo_cbi_tributario;          */
