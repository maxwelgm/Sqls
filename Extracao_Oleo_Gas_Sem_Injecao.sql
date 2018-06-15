SELECT Z.UNOP_CD_UNID_OPER,
       Z.CAMP_SG_CAMPO,
       Z.CAMP_NM_CAMPO,
       Z.ANO,
       SUM( DECODE( Z.FLUI_CD_FLUIDO, 181, Z.PRODUCAO, 0 ))/1000 AS PGAS,
       SUM( DECODE( Z.FLUI_CD_FLUIDO, 187, Z.PRODUCAO, 179, Z.PRODUCAO, 0 )) AS POLEO
  FROM (SELECT CFM.UNOP_CD_UNID_OPER,
               C.CAMP_SG_CAMPO,
               C.CAMP_NM_CAMPO,
               CFM.FLUI_CD_FLUIDO,
               TO_CHAR(CFM.COFM_DT_REFERENCIA, 'mm/yyyy') AS ANO,
               SUM(CFM.COFM_QA_FL_REALIZA) AS PRODUCAO
          FROM APR.COLUNA_FLUIDO_MES CFM,
               EEP.POCO              P,
               RST.CAMPO             C
         WHERE C.CAMP_CD_CAMPO = P.CAMP_CD_CAMPO AND
               P.POCO_CD_POCO = CFM.POCO_CD_POCO AND
               CFM.FLUI_CD_FLUIDO IN (179, 187, 181) AND
               --C.CAMP_SG_CAMPO IN ('CRL', 'MLZ') AND
               CFM.TIOP_CD_TIPO_OPER = 'P' AND
               CFM.COFM_DT_REFERENCIA >= TO_DATE('01/02/2008', 'dd/mm/yyyy') AND
               CFM.COFM_DT_REFERENCIA <= TO_DATE('29/02/2008', 'dd/mm/yyyy')
         GROUP BY CFM.UNOP_CD_UNID_OPER,
                  CFM.FLUI_CD_FLUIDO,
                  C.CAMP_SG_CAMPO,
                  C.CAMP_NM_CAMPO,
                  CFM.COFM_DT_REFERENCIA
) Z
 GROUP BY Z.UNOP_CD_UNID_OPER,
          Z.CAMP_SG_CAMPO,
          Z.CAMP_NM_CAMPO,
          Z.ANO
 ORDER BY Z.UNOP_CD_UNID_OPER, Z.CAMP_NM_CAMPO, Z.ANO