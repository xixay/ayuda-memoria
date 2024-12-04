
## Reporte-Evaluaciones: Reporte-Numerico:
- Generar subreporte para recibire datos de Actividades y ejecutora, de acuedo a agrupacion de tipos de trabajo (Preguntar por columnas 3 o 4)
- Generar subreporte para impresión de datos de la unidad padre, y el agrupado del anterior subreporte (Tomar en cuenta colores de reporte ejemplo)
- Generar subreporte para impresión de datos del programa, tomando en cuenta subreportes previos y totales (Tomar en cuenta totales)
- Generar reporte principal, para almacenamiento de columnas principales, titulos, especificaciones de logos, paginado
- Formulario para generar reporte, tomar en cuenta filtros que recibira el servicio principal de datos del reporte
- Servicio para obtener el reporte de jasper, de acuedo a solicitud de frontend
## Reporte-Evaluaciones: Reporte-Detallado:
- Generar subreporte para datos de la evaluación, tomando en cuenta agrupacion de columnas
- Generar subreporte para datos de ejecutora, y actividad o ACP
- Generar subreporte para datos de TEXTO tomando en cuenta totales de subreportes anteriores
- Generar subreporte para datos de TIPO DE TRABAJO tomando en cuenta totales de subreportes anteriores
- Generar reporte principal, para almacenamiento de columnas principales, titulos, especificaciones de logos, paginado
- Formulario para generar reporte, tomar en cuenta filtros que recibira el servicio principal de datos del reporte
- Servicio para obtener el reporte de jasper, de acuedo a solicitud de frontend
## Considerar
- diagramar los reportes
- Los textos , son sugerentes, decidir como realizar el reporte
json-server --watch reporte.json --port 7008
http://172.16.22.243:7008
RptPdfF15
```
"SrptXlsEvaluacionesNumericoAreasPrincipales.jrxml"
new net.sf.jasperreports.engine.data.JsonDataSource(new ByteArrayInputStream($F{areas_principales}.toString().getBytes()),"")
```
## Servicios CONAUD
```
src/feature/sispoa-areas-unidades/sispoa-areas-unidades.controller.ts
findAllUnidadesPrincipales
```
```
"SrptXlsEvaluacionesNumericoEjecutoras.jrxml"
new net.sf.jasperreports.engine.data.JsonDataSource(new ByteArrayInputStream($F{ejecutoras}.toString().getBytes()),"")
```

## reporte 


```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.11.0.final using JasperReports Library version 6.11.0-0c4056ccaa4d25a5a8c45672d2f764ea3498bebb  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="Blank_A4" pageWidth="842" pageHeight="595" orientation="Landscape" columnWidth="802" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="1980c104-5f43-4575-b994-ea576dbcbef8">
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="Adapter Conaud JSON SERVER"/>
	<property name="com.jaspersoft.studio.unit." value="pixel"/>
	<property name="com.jaspersoft.studio.unit.pageHeight" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.pageWidth" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.topMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.bottomMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.leftMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.rightMargin" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.columnWidth" value="pixel"/>
	<property name="com.jaspersoft.studio.unit.columnSpacing" value="pixel"/>
	<property name="net.sf.jasperreports.export.xls.remove.empty.space.between.rows" value="true"/>
	<property name="net.sf.jasperreports.export.xls.remove.empty.space.between.columns" value="true"/>
	<property name="net.sf.jasperreports.export.xls.detect.cell.type" value="true"/>
	<property name="net.sf.jasperreports.export.xls.ignore.cell.background" value="false"/>
	<property name="net.sf.jasperreports.export.xls.ignore.graphics" value="false"/>
	<property name="net.sf.jasperreports.export.xls.collapse.row.span" value="false"/>
	<property name="net.sf.jasperreports.export.xls.white.page.background" value="false"/>
	<property name="net.sf.jasperreports.export.xls.one.page.per.sheet" value="false"/>
	<property name="net.sf.jasperreports.export.xls.ignore.cell.border" value="false"/>
	<subDataset name="Dataset1" uuid="6de8af30-0ef5-4cb8-9f6a-0671a18ecbd0">
		<queryString>
			<![CDATA[]]>
		</queryString>
	</subDataset>
	<queryString language="WebServiceQuery">
		<![CDATA[{
            "getparameters" : { },
            "fields" : [
                { "name" : "pobj_nombre", "expression" : "pobj_nombre" },
                { "name" : "ejecucion_1", "expression" : "ejecucion_1" },
                { "name" : "proceso_1", "expression" : "proceso_1" },
                { "name" : "cerrado_1", "expression" : "cerrado_1" },
                { "name" : "total_1", "expression" : "total_1" },
                { "name" : "ejecucion_2", "expression" : "ejecucion_2" },
                { "name" : "proceso_2", "expression" : "proceso_2" },
                { "name" : "cerrado_2", "expression" : "cerrado_2" },
                { "name" : "total_2", "expression" : "total_2" }
            ],
            "options" : {
                "contentType" : "application/json",
                "rootPath" : "",
                "baseUrl" : "/datos"
            },
            "headersMap" : { },
            "queryData" : "",
            "GETParameters" : { }
        }]]>
	</queryString>
	<field name="pobj_nombre" class="java.lang.String"/>
	<field name="ejecucion_1" class="java.lang.String"/>
	<field name="proceso_1" class="java.lang.String"/>
	<field name="cerrado_1" class="java.lang.String"/>
	<field name="total_1" class="java.lang.String"/>
	<field name="ejecucion_2" class="java.lang.String"/>
	<field name="proceso_2" class="java.lang.String"/>
	<field name="cerrado_2" class="java.lang.String"/>
	<field name="total_2" class="java.lang.String"/>
	<group name="GroupPobjNombre">
		<groupExpression><![CDATA[$F{pobj_nombre}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<detail>
		<band height="218">
			<componentElement>
				<reportElement x="328" y="18" width="200" height="200" uuid="24da728f-690e-4f0c-9483-f263a015c5dc">
					<property name="com.jaspersoft.studio.layout" value="com.jaspersoft.studio.editor.layout.VerticalRowLayout"/>
					<property name="com.jaspersoft.studio.table.style.table_header" value="Table_TH"/>
					<property name="com.jaspersoft.studio.table.style.column_header" value="Table_CH"/>
					<property name="com.jaspersoft.studio.table.style.detail" value="Table_TD"/>
				</reportElement>
				<jr:table xmlns:jr="http://jasperreports.sourceforge.net/jasperreports/components" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports/components http://jasperreports.sourceforge.net/xsd/components.xsd">
					<datasetRun subDataset="Dataset1" uuid="1846af6f-faaa-4b89-9a79-c6082b23ba4e">
						<parametersMapExpression><![CDATA[$F{ejecucion_1}]]></parametersMapExpression>
					</datasetRun>
					<jr:column width="100" uuid="a3c1b5b0-d61d-4ed1-b7a7-b9f1587d1b95">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement style="Table_TD" x="0" y="0" width="100" height="30" uuid="c7c432a5-2171-48ca-8555-484f1048a7c2"/>
								<textFieldExpression><![CDATA[$F{pobj_nombre}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="80" uuid="b80685a4-639d-4cde-b597-0f8995614425">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement style="Table_TD" x="0" y="0" width="80" height="30" uuid="0b92cf11-74da-4f6a-97f4-d4330506d3af"/>
								<textFieldExpression><![CDATA[$F{otro_campo}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="50" uuid="c72d5358-e07a-4c6b-8ed9-3819db75da87">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField>
								<reportElement style="Table_TD" x="0" y="0" width="50" height="30" uuid="7a452554-53fe-4147-b89d-777a5f90a31c"/>
								<textFieldExpression><![CDATA[$F{flag_eliminacion}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
				</jr:table>
			</componentElement>
		</band>
	</detail>
</jasperReport>

```

- https://community.jaspersoft.com/knowledgebase/best-practices/how-merge-table-rows-repeated-values/#wiki-header-2
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.11.0.final using JasperReports Library version 6.11.0-0c4056ccaa4d25a5a8c45672d2f764ea3498bebb  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="Blank_A4_Landscape" pageWidth="842" pageHeight="595" orientation="Landscape" columnWidth="802" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="a5fcb62e-a2ff-4867-8a7b-9f36573b68ef">
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="Adapter Conaud JSON SERVER"/>
	<style name="Table_TH" mode="Opaque" backcolor="#F0F8FF">
		<box>
			<pen lineWidth="0.5" lineColor="#000000"/>
			<topPen lineWidth="0.5" lineColor="#000000"/>
			<leftPen lineWidth="0.5" lineColor="#000000"/>
			<bottomPen lineWidth="0.5" lineColor="#000000"/>
			<rightPen lineWidth="0.5" lineColor="#000000"/>
		</box>
	</style>
	<style name="Table_CH" mode="Opaque" backcolor="#BFE1FF">
		<box>
			<pen lineWidth="0.5" lineColor="#000000"/>
			<topPen lineWidth="0.5" lineColor="#000000"/>
			<leftPen lineWidth="0.5" lineColor="#000000"/>
			<bottomPen lineWidth="0.5" lineColor="#000000"/>
			<rightPen lineWidth="0.5" lineColor="#000000"/>
		</box>
	</style>
	<style name="Table_TD" mode="Opaque" backcolor="#FFFFFF">
		<box>
			<pen lineWidth="0.5" lineColor="#000000"/>
			<topPen lineWidth="0.5" lineColor="#000000"/>
			<leftPen lineWidth="0.5" lineColor="#000000"/>
			<bottomPen lineWidth="0.5" lineColor="#000000"/>
			<rightPen lineWidth="0.5" lineColor="#000000"/>
		</box>
	</style>
	<subDataset name="Dataset1" uuid="af85daca-67a4-4f9b-a199-b141399eda09">
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="Adapter Local JSONSERVER"/>
		<queryString language="WebServiceQuery">
			<![CDATA[{
  "getparameters" : { },
  "fields" : [ {
    "name" : "pobj_nombre",
    "expression" : "pobj_nombre"
  }, {
    "name" : "ejecucion_1",
    "expression" : "ejecucion_1"
  }, {
    "name" : "proceso_1",
    "expression" : "proceso_1"
  }, {
    "name" : "cerrado_1",
    "expression" : "cerrado_1"
  }, {
    "name" : "total_1",
    "expression" : "total_1"
  } ],
  "options" : {
    "contentType" : "application/json",
    "rootPath" : "",
    "baseUrl" : "/datos"
  },
  "headersMap" : { },
  "queryData" : "",
  "GETParameters" : { }
}]]>
		</queryString>
		<field name="pobj_nombre" class="java.lang.String"/>
		<field name="ejecucion_1" class="java.lang.String"/>
		<field name="proceso_1" class="java.lang.String"/>
		<field name="cerrado_1" class="java.lang.String"/>
		<field name="total_1" class="java.lang.String"/>
	</subDataset>
	<subDataset name="Dataset2" uuid="7edcaa5b-10b8-4a4c-b14e-041fc91062ce">
		<property name="com.jaspersoft.studio.data.defaultdataadapter" value="Adapter Conaud JSON SERVER"/>
		<queryString language="WebServiceQuery">
			<![CDATA[{
  "getparameters" : { },
  "fields" : [ {
    "name" : "pobj_nombre",
    "expression" : "pobj_nombre"
  }, {
    "name" : "ejecucion_1",
    "expression" : "ejecucion_1"
  }, {
    "name" : "proceso_1",
    "expression" : "proceso_1"
  }, {
    "name" : "cerrado_1",
    "expression" : "cerrado_1"
  }, {
    "name" : "total_1",
    "expression" : "total_1"
  }, {
    "name" : "ejecucion_2",
    "expression" : "ejecucion_2"
  }, {
    "name" : "proceso_2",
    "expression" : "proceso_2"
  }, {
    "name" : "cerrado_2",
    "expression" : "cerrado_2"
  }, {
    "name" : "total_2",
    "expression" : "total_2"
  } ],
  "options" : {
    "contentType" : "application/json",
    "rootPath" : "",
    "baseUrl" : "/datos"
  },
  "headersMap" : { },
  "queryData" : "",
  "GETParameters" : { }
}]]>
		</queryString>
		<field name="pobj_nombre" class="java.lang.String"/>
		<field name="ejecucion_1" class="java.lang.String"/>
		<field name="proceso_1" class="java.lang.String"/>
		<field name="cerrado_1" class="java.lang.String"/>
		<field name="total_1" class="java.lang.String"/>
		<field name="ejecucion_2" class="java.lang.String"/>
		<field name="proceso_2" class="java.lang.String"/>
		<field name="cerrado_2" class="java.lang.String"/>
		<field name="total_2" class="java.lang.String"/>
		<group name="pobj_nombre">
			<groupExpression><![CDATA[$F{pobj_nombre}]]></groupExpression>
		</group>
	</subDataset>
	<queryString language="WebServiceQuery">
		<![CDATA[{
  "getparameters" : { },
  "fields" : [ {
    "name" : "pobj_nombre",
    "expression" : "pobj_nombre"
  }, {
    "name" : "ejecucion_1",
    "expression" : "ejecucion_1"
  }, {
    "name" : "proceso_1",
    "expression" : "proceso_1"
  }, {
    "name" : "cerrado_1",
    "expression" : "cerrado_1"
  }, {
    "name" : "total_1",
    "expression" : "total_1"
  }, {
    "name" : "ejecucion_2",
    "expression" : "ejecucion_2"
  }, {
    "name" : "proceso_2",
    "expression" : "proceso_2"
  }, {
    "name" : "cerrado_2",
    "expression" : "cerrado_2"
  }, {
    "name" : "total_2",
    "expression" : "total_2"
  } ],
  "options" : {
    "contentType" : "application/json",
    "rootPath" : "",
    "baseUrl" : "/datos"
  },
  "headersMap" : { },
  "queryData" : "",
  "GETParameters" : { }
}]]>
	</queryString>
	<field name="pobj_nombre" class="java.lang.String"/>
	<field name="ejecucion_1" class="java.lang.String"/>
	<field name="proceso_1" class="java.lang.String"/>
	<field name="cerrado_1" class="java.lang.String"/>
	<field name="total_1" class="java.lang.String"/>
	<field name="ejecucion_2" class="java.lang.String"/>
	<field name="proceso_2" class="java.lang.String"/>
	<field name="cerrado_2" class="java.lang.String"/>
	<field name="total_2" class="java.lang.String"/>
	<background>
		<band splitType="Stretch"/>
	</background>
	<title>
		<band height="79" splitType="Stretch"/>
	</title>
	<summary>
		<band height="282" splitType="Stretch">
			<componentElement>
				<reportElement x="308" y="82" width="200" height="200" uuid="fe63bc14-8f4e-4537-900f-5d859f4382a0">
					<property name="com.jaspersoft.studio.layout" value="com.jaspersoft.studio.editor.layout.VerticalRowLayout"/>
					<property name="com.jaspersoft.studio.table.style.table_header" value="Table_TH"/>
					<property name="com.jaspersoft.studio.table.style.column_header" value="Table_CH"/>
					<property name="com.jaspersoft.studio.table.style.detail" value="Table_TD"/>
				</reportElement>
				<jr:table xmlns:jr="http://jasperreports.sourceforge.net/jasperreports/components" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports/components http://jasperreports.sourceforge.net/xsd/components.xsd">
					<datasetRun subDataset="Dataset2" uuid="d579903e-81bb-4a14-b8fb-4e87f99b6eaf">
						<dataSourceExpression><![CDATA[new net.sf.jasperreports.engine.data.JsonDataSource(
    new ByteArrayInputStream(String.format(
        "{\"pobj_nombre\": %s, \"ejecucion_1\": %s, \"proceso_1\": %s, \"cerrado_1\": %s, \"total_1\": %s, \"ejecucion_2\": %s, \"cerrado_2\": %s, \"proceso_2\": %s, \"total_2\": %s}",
        $F{pobj_nombre} != null ? "\"" + $F{pobj_nombre}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{ejecucion_1} != null ? "\"" + $F{ejecucion_1}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{proceso_1} != null ? "\"" + $F{proceso_1}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{cerrado_1} != null ? "\"" + $F{cerrado_1}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{total_1} != null ? "\"" + $F{total_1}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{ejecucion_2} != null ? "\"" + $F{ejecucion_2}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{cerrado_2} != null ? "\"" + $F{cerrado_2}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{proceso_2} != null ? "\"" + $F{proceso_2}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null,
        $F{total_2} != null ? "\"" + $F{total_2}.toString().replaceAll("\\\\", "\\\\\\\\").replaceAll("\"", "\\\\\"") + "\"" : null
    ).getBytes()),
    ""
)]]></dataSourceExpression>
					</datasetRun>
					<jr:column width="22" uuid="8baf3dac-f327-4a4d-b04a-d2a59a7d6134">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="b0924cb7-7507-46c4-bf5d-92690b656ac3"/>
								<text><![CDATA[pobj_nombre]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="519c174e-e656-469e-a45c-f9f8e3074fe0"/>
								<textFieldExpression><![CDATA[$F{pobj_nombre}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="64df3f1c-f7a5-457a-8962-92584c438967">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="c45d5e6e-a03a-4875-8961-79e6766ecf63"/>
								<text><![CDATA[ejecucion_1]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="f8f76a58-5956-4973-b333-80d1d69c2fc0"/>
								<textFieldExpression><![CDATA[$F{ejecucion_1}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="837d3df2-a46f-471e-a809-d1fd0b2a90e7">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="a06a448b-f22d-450e-a46c-eab4ed29d3d0"/>
								<text><![CDATA[proceso_1]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="9e5a8f0c-5f9f-40c3-bb80-89e03b3dd599"/>
								<textFieldExpression><![CDATA[$F{proceso_1}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="0942aba1-09cd-4349-bba1-d622e3c41ff5">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="ba433553-8ec3-4fd7-8e31-e5db7a5d358e"/>
								<text><![CDATA[cerrado_1]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="3a497108-1163-4d19-bae0-26321f66da32"/>
								<textFieldExpression><![CDATA[$F{cerrado_1}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="fcfe1e8d-2935-46a3-8495-37f476870285">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="b4b334a5-bd1e-457c-b757-7958ed403908"/>
								<text><![CDATA[total_1]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="c93f35d7-4651-4d8f-9b10-063e28f114f3"/>
								<textFieldExpression><![CDATA[$F{total_1}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="e162ff2f-5c22-46bb-83a2-d8a5b9f0abcc">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="930b75ca-6b29-4ae7-a722-aa1272bf654a"/>
								<text><![CDATA[ejecucion_2]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="9c5d98a2-e07f-4127-bb26-8ebf440644a5"/>
								<textFieldExpression><![CDATA[$F{ejecucion_2}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="819bd701-6d2a-4ed9-a171-d28d5b152ddf">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="ce4e3cd0-afe3-43e6-b099-ff16f5aaf9bc"/>
								<text><![CDATA[proceso_2]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="4f69e9d3-483d-4502-99e5-288cf4ff9e9f"/>
								<textFieldExpression><![CDATA[$F{proceso_2}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="a3ea6961-f47b-49fd-ab0e-715deb140b09">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="fa264acd-04e5-4917-bcea-c170675f761c"/>
								<text><![CDATA[cerrado_2]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="5c094bbb-087d-44da-8153-115ff3de4bb6"/>
								<textFieldExpression><![CDATA[$F{cerrado_2}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
					<jr:column width="22" uuid="3c3b911e-67fe-4883-b182-d510cdc28ff0">
						<jr:tableHeader style="Table_TH" height="30"/>
						<jr:tableFooter style="Table_TH" height="30"/>
						<jr:columnHeader style="Table_CH" height="30">
							<staticText>
								<reportElement x="0" y="0" width="22" height="30" uuid="314906fc-f271-4b10-bbf2-af7b0225b9e0"/>
								<text><![CDATA[total_2]]></text>
							</staticText>
						</jr:columnHeader>
						<jr:columnFooter style="Table_CH" height="30"/>
						<jr:detailCell style="Table_TD" height="30">
							<textField textAdjust="StretchHeight">
								<reportElement x="0" y="0" width="22" height="30" uuid="ba668508-795b-4672-8938-444f591fa52e"/>
								<textFieldExpression><![CDATA[$F{total_2}]]></textFieldExpression>
							</textField>
						</jr:detailCell>
					</jr:column>
				</jr:table>
			</componentElement>
		</band>
	</summary>
</jasperReport>

```
## Reportes Hechos
```Reportes hechos
############  Reporte  ###############
RptXlsEvaluacionesNumerico.jrxml

############  Inputs   #############
"/Images/logoCge2024.png"
s_token
s_query

############ Sub reportes ##############
SrptXlsEvaluacionesNumericoProgramas.jrxml
SrptXlsEvaluacionesNumericoAreasPrincipales.jrxml
SrptXlsEvaluacionesNumericoAcp.jrxml
SrptXlsEvaluacionesNumericoEjecutoras.jrxml




############  Reporte  6 ###############
RptXlsEvaluacionesDetallado.jrxml

############  Inputs   #############
"/Images/logoCge2024.png"
s_token
s_query

############ Sub reportes ##############
SrptXlsEvaluacionesDetalladoProgramas.jrxml
SrptXlsEvaluacionesDetalladoTipoTrabajo.jrxml
SrptXlsEvaluacionesDetalladoAreasPrincipales.jrxml
SrptXlsEvaluacionesDetalladoAcp.jrxml
SrptXlsEvaluacionesDetalladoEjecutoras.jrxml
SrptXlsEvaluacionesDetalladoEntidades.jrxml
```