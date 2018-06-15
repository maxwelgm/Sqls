select V.*
from   vw_lista_bmp v,
       (select substr(v.nome_xml_original, 1, 3) Tipo,
               substr(v.NOME_XML_ORIGINAL, 27, 6) AnoMes,
               max(v.DATA_CRIACAO) Data
        from   vw_lista_bmp v
        where  substr(v.NOME_XML_ORIGINAL, 27, 6) = '201511'
        group  by substr(v.nome_xml_original, 1, 3),
                  substr(v.NOME_XML_ORIGINAL, 27, 6)) Maior_Data
where  substr(v.NOME_XML_ORIGINAL, 27, 6) = '201511'
       and substr(v.NOME_XML_ORIGINAL, 27, 6) = Maior_Data.AnoMes
       and substr(v.NOME_XML_ORIGINAL, 1, 3) = Maior_Data.Tipo
       and v.DATA_CRIACAO = Maior_Data.Data
