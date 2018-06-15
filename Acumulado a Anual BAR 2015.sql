-- Acumulado total
select UO,
       CD_CAMPO,
       CAMPO,
       nvl(POLEO,0) POLEO,
       nvl(PCOND,0) PCOND,
       /*nvl(GA,0) GA,
       nvl(GNA,0) GNA,*/
       nvl(PGAS,0) PGAS,
       nvl(PAGUA,0) PAGUA,
       nvl(IGAS,0) IGAS,
       nvl(IAGUA,0) IAGUA
from (
select NVL(IP.UNOP_CD_UNID_OPER, c.UNOP_CD_UNID_OPER) UO,
       MCF.MECA_CD_CAMPO CD_CAMPO,
       c.camp_sg_campo CAMPO,
       MCF.CURV_CD_CURV CD_CURVA,
       MCF.MECA_VL_MEDI MD
from   CPROD.MEDI_CAMP_FECH  MCF,
       CPROD.INFO_PART_CAMPO IP,
       RST.CAMPO             C
where  MCF.MECA_CD_CAMPO = IP.CAMP_CD_CAMPO(+)
       and MCF.MECA_CD_CAMPO = C.CAMP_CD_CAMPO
       and MCF.CURV_CD_CURV in (1,2,7,6,5,10) --in (1,2,21,22,7,6,5,10)
       and MCF.MECA_ANO_MES <= 201512
order  by NVL(IP.UNOP_CD_UNID_OPER, c.UNOP_CD_UNID_OPER),
          c.camp_sg_campo
)
pivot (sum(MD) for CD_CURVA in (1 POLEO,2 PCOND,/*21 GA,22 GNA,*/7 PGAS,6 PAGUA,5 IGAS,10 IAGUA))

order by UO, CAMPO;

--2015
select UO,
       CD_CAMPO,
       CAMPO,
       nvl(POLEO,0) POLEO,
       nvl(PCOND,0) PCOND,
       /*nvl(GA,0) GA,
       nvl(GNA,0) GNA,*/
       nvl(PGAS,0) PGAS,
       nvl(PAGUA,0) PAGUA,
       nvl(IGAS,0) IGAS,
       nvl(IAGUA,0) IAGUA
from (
select NVL(IP.UNOP_CD_UNID_OPER, c.UNOP_CD_UNID_OPER) UO,
       MCF.MECA_CD_CAMPO CD_CAMPO,
       c.camp_sg_campo CAMPO,
       MCF.CURV_CD_CURV CD_CURVA,
       MCF.MECA_VL_MEDI MD
from   CPROD.MEDI_CAMP_FECH  MCF,
       CPROD.INFO_PART_CAMPO IP,
       RST.CAMPO             C
where  MCF.MECA_CD_CAMPO = IP.CAMP_CD_CAMPO(+)
       and MCF.MECA_CD_CAMPO = C.CAMP_CD_CAMPO
       and mcf.curv_cd_curv in (1,2,7,6,5,10) --in (1,2,21,22,7,6,5,10)
       and MCF.MECA_ANO_MES between 201501 and 201512
order  by NVL(IP.UNOP_CD_UNID_OPER, c.UNOP_CD_UNID_OPER),
          c.camp_sg_campo
)
pivot (sum(MD) for CD_CURVA in (1 POLEO,2 PCOND,/*21 GA,22 GNA,*/7 PGAS,6 PAGUA,5 IGAS,10 IAGUA))

order by UO, CAMPO;
