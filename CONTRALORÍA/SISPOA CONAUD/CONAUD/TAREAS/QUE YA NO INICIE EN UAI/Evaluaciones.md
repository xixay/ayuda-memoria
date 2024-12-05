## Servicio
```

```
curl 'http://172.16.22.232:7008/inicio-evaluacion-informe' \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Accept-Language: es-419,es;q=0.9' \
  -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJfY29kaWdvIjoxNjQzLCJzaXN0ZW1hcyI6W3sic2lzY2dlX2NvZGlnbyI6MzQsInNpc2NnZV9zaWdsYSI6InNpc3BvYSJ9LHsic2lzY2dlX2NvZGlnbyI6MzcsInNpc2NnZV9zaWdsYSI6ImNvbmF1ZCJ9XSwicm9sZXMiOlt7InNpc2NnZV9jb2RpZ28iOjM0LCJyb2xfY29kaWdvIjoxOTAsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifSx7InNpc2NnZV9jb2RpZ28iOjM3LCJyb2xfY29kaWdvIjoyMDgsInJvbF9kZXNjcmlwY2lvbiI6Ik9wZXJhZG9yIEZvcm11bGFyaW8ifV0sImlkIjoiYWMzNDk3YTEtYmM1Yi00MTFkLTgzMGItYTkyODYyNTkzY2NiIiwidGlwbyI6InVzdWFyaW8iLCJpYXQiOjE3MzM0MzgzMDIsImV4cCI6MTczMzQ2NzEwMiwibW9tZW50IjoiMjAyNC0xMi0wNVQxODozODoyMi0wNDowMCJ9.Owiflu5Mh5XzO2Gu2lhD1m5E38pwEF54DGAGEYRvbJnXycosyLn7HmTgW2msxO2EDnVXIgcl67urzf-hZyk1cg' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Origin: http://172.16.22.232:3002' \
  -H 'Referer: http://172.16.22.232:3002/' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' \
  --data-raw '{"per_codigo_gerente":1914,"per_codigo_responsable":1643,"iua_fecha_inicio_evaluacion":"2024-12-12T04:00:00.000Z","iua_fecha_fin_evaluacion":"2024-12-12T04:00:00.000Z","iei_descripcion":"prueba","iei_objeto":"prueba","iei_objetivo":"prueba","iei_alcance":"prueba","iei_oficina_central":1,"iei_observaciones":"prueba","iua_codigo":1537,"iua_codigo_control":"UAIKK/R"}' \
  --insecure
  
  ## Funcion
  deconsolidateInformesUai


src/feature/informes-uai/service/create-informes-uai.service.ts