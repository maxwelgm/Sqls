select p.POCO_SG_PREF_DEPEX as "Sigla", p.POCO_MD_MERID_CENT as MC, 
       p.POCO_MD_NUTM_PR_FN as "Ynor fundo", p.POCO_MD_LUTM_PR_FN as "Xest fundo", 
       p.POCO_MD_NUTM_BASE as "Ynor base", p.POCO_MD_LUTM_BASE as "Xest base", 
       p.POCO_MD_LATI_FUNDO, p.POCO_MD_LONG_FUNDO, p.POCO_MD_LUTM_FUNDO, p.POCO_MD_NUTM_FUNDO
  from eep.poco p 
  where p.UNOP_CD_UNID_OPER = 120
--  and (p.POCO_SG_PREF_DEPEX = '8RO  0623  SE' or p.POCO_SG_PREF_DEPEX = '7RO  0684  SE')
