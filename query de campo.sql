select c.unop_cd_unid_oper,
       c.camp_cd_campo,       
       ipc.inpa_cd_campo_anp,
       c.camp_sg_campo,
       ipc.inpa_sg_campo,
       c.camp_nm_campo,
       c.stca_cd_campo,
       ipc.stca_cd_campo,
       c.bloc_cd_bloco
from rst.campo c , cprod.info_part_campo ipc
where 
c.camp_cd_campo = 1079 and 
c.camp_cd_campo = ipc.camp_cd_campo(+)
