CREATE OR REPLACE VIEW PRO.VW_ARVORE_CUSTO AS
SELECT a.arct_sq_arct CD_ARV,
              i.itac_cd_item CD_ITEM,
              i.itac_sg_item SG_ITEM,
              v.ivia_nm_item NM_ITEM,
              LPAD (' ', 10 * LEVEL - 1) || v.ivia_nm_item NM_ITEM_IDENTADO,
              SYS_CONNECT_BY_PATH (v.ivia_nm_item, '/') NM_PATH,
              a.arct_sq_arct_pai CD_ARV_PAI,
              2 * LEVEL - 1 NIVEL,
              CONNECT_BY_ISLEAF IS_FOLHA,
              un.umac_cd_unid_med CD_UNID_MED,
              un.umac_nm_unid_med NM_UNID_MED,
              ca.clac_cd_classe CD_CLASSE,
              ca.clac_nm_classe NM_CLASSE,
              ca.clac_mm_cor DS_COR_CLASSE,
              a.arct_in_procop IN_PROCOP_ARV,
              i.itac_in_procop IN_PROCOP_ITEM,
              v.viac_cd_versao CD_VERSAO,
              i.itac_cd_origem CD_ORIGEM,
              a.arct_nr_ordem CD_ORDEM,
              a.arct_in_default IN_DEFAULT
         FROM pro.arvore_custo a,
              pro.item_arv_cust i,
              pro.item_ver_item_ac v,
              pro.dm_unid_med_ac un,
              pro.cls_arv_cust ca
        WHERE     a.itac_cd_item = i.itac_cd_item
              AND a.viac_cd_versao = v.viac_cd_versao
              AND a.itac_cd_item = v.itac_cd_item
              AND i.umac_cd_unid_med = un.umac_cd_unid_med
              AND i.clac_cd_classe = ca.clac_cd_classe
   START WITH a.arct_sq_arct_pai IS NULL
   CONNECT BY PRIOR a.arct_sq_arct = a.arct_sq_arct_pai
     ORDER BY a.arct_nr_ordem;
