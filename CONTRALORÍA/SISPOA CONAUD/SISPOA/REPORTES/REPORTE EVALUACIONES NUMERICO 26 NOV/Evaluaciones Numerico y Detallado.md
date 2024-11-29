## Reporte
- Vas a trabajar en los reportes, los que tienen las pestañas ROJAS
## Reporte-Evaluaciones: Reporte-Numerico:
- Generar subreporte para recibire datos de Actividades y ejecutora, de acuedo a agrupacion de tipos de trabajo (Preguntar por columnas 3 o 4)
- Generar subreporte para impresión de datos de la unidad padre, y el agrupado del anterior subreporte (Tomar en cuenta colores de reporte ejemplo)
- Generar subreporte para impresión de datos del programa, tomando en cuenta subreportes previos y totales (Tomar en cuenta totales)
- Generar reporte principal, para almacenamiento de columnas principales, titulos, especificaciones de logos, paginado
- Formulario para generar reporte, tomar en cuenta filtros que recibira el servicio principal de datos del reporte
- Servicio para obtener el reporte de jasper, de acuedo a solicitud de frontend
## 
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

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.11.0.final using JasperReports Library version 6.11.0-0c4056ccaa4d25a5a8c45672d2f764ea3498bebb  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="year_sum_quarter" language="groovy" pageWidth="595" pageHeight="842" columnWidth="555" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="b78327da-c4ee-42e8-9c60-327aab76522d">
	<property name="ireport.zoom" value="1.0"/>
	<property name="ireport.x" value="0"/>
	<property name="ireport.y" value="0"/>
	<queryString>
		<![CDATA[]]>
	</queryString>
	<field name="year" class="java.lang.Integer"/>
	<field name="month" class="java.lang.String"/>
	<field name="sum" class="java.lang.Integer"/>
	<field name="q" class="java.lang.Integer"/>
	<variable name="yearSum" class="java.lang.Integer" resetType="Group" resetGroup="yearGroup" calculation="Sum">
		<variableExpression><![CDATA[$F{sum}]]></variableExpression>
	</variable>
	<variable name="qSum" class="java.lang.Integer" resetType="Group" resetGroup="quaterGroup" calculation="Sum">
		<variableExpression><![CDATA[$F{sum}]]></variableExpression>
	</variable>
	<group name="yearGroup">
		<groupExpression><![CDATA[$F{year}]]></groupExpression>
		<groupFooter>
			<band height="20">
				<textField>
					<reportElement x="100" y="0" width="100" height="20" uuid="614a0d3d-5f7c-44eb-aa04-69417f697f82"/>
					<box leftPadding="10">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="0.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="0.0"/>
					</box>
					<textFieldExpression><![CDATA["Jan-Dec, " + $F{year}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="200" y="0" width="100" height="20" uuid="3cb982ab-5453-4049-a246-2eb0ab2ef168"/>
					<box leftPadding="0">
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="0.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="0.0"/>
					</box>
					<textFieldExpression><![CDATA[$V{yearSum}]]></textFieldExpression>
				</textField>
				<staticText>
					<reportElement x="0" y="0" width="100" height="20" uuid="5497feaa-c460-47cd-a0dc-f70a6d1cc80b"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="1.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="0.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true" isItalic="true"/>
					</textElement>
					<text><![CDATA[]]></text>
				</staticText>
				<staticText>
					<reportElement x="300" y="0" width="100" height="20" uuid="f916a954-641f-409b-8a9f-adab645e53ab"/>
					<box>
						<topPen lineWidth="1.0"/>
						<leftPen lineWidth="0.0"/>
						<bottomPen lineWidth="1.0"/>
						<rightPen lineWidth="1.0"/>
					</box>
					<textElement textAlignment="Center" verticalAlignment="Middle">
						<font isBold="true" isItalic="true"/>
					</textElement>
					<text><![CDATA[]]></text>
				</staticText>
			</band>
		</groupFooter>
	</group>
	<group name="quaterGroup">
		<groupExpression><![CDATA[$F{year} + $F{q}]]></groupExpression>
	</group>
	<columnHeader>
		<band height="50">
			<staticText>
				<reportElement x="100" y="30" width="100" height="20" uuid="cee8554c-26a9-45d8-b55a-e3704eada85d"/>
				<box>
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true" isItalic="true"/>
				</textElement>
				<text><![CDATA[Month]]></text>
			</staticText>
			<staticText>
				<reportElement x="0" y="30" width="100" height="20" uuid="1c9c23d5-5ab1-43b3-bd6a-537bc4c6affc"/>
				<box>
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true" isItalic="true"/>
				</textElement>
				<text><![CDATA[Year]]></text>
			</staticText>
			<staticText>
				<reportElement x="200" y="30" width="100" height="20" uuid="85b8693f-752d-49a6-b2a5-6a08a5d86d09"/>
				<box>
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true" isItalic="true"/>
				</textElement>
				<text><![CDATA[Month Sum]]></text>
			</staticText>
			<staticText>
				<reportElement x="300" y="30" width="100" height="20" uuid="96e12be1-9622-451d-a4b0-cc7659319173"/>
				<box>
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true" isItalic="true"/>
				</textElement>
				<text><![CDATA[Quarter Sum]]></text>
			</staticText>
		</band>
	</columnHeader>
	<detail>
		<band height="20" splitType="Stretch">
			<staticText>
				<reportElement x="300" y="0" width="100" height="20" uuid="66085c40-440c-4333-98a9-00dc0463451e"/>
				<box>
					<topPen lineWidth="0.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="0.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true" isItalic="true"/>
				</textElement>
				<text><![CDATA[]]></text>
			</staticText>
			<staticText>
				<reportElement x="0" y="0" width="100" height="20" uuid="9edc50d4-68c0-49b1-a82f-4b7a8505f59d"/>
				<box>
					<topPen lineWidth="0.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="0.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textElement textAlignment="Center" verticalAlignment="Middle">
					<font isBold="true" isItalic="true"/>
				</textElement>
				<text><![CDATA[]]></text>
			</staticText>
			<textField>
				<reportElement x="0" y="0" width="100" height="20" uuid="f2defc2a-2b81-4298-af1e-db08196a1483">
					<printWhenExpression><![CDATA[$V{yearGroup_COUNT} == 1]]></printWhenExpression>
				</reportElement>
				<box leftPadding="10">
					<topPen lineWidth="0.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="0.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$F{year}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="200" y="0" width="100" height="20" uuid="b0b6c9d5-cb18-4497-9c26-42e0e4814206"/>
				<box leftPadding="10">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$F{sum}]]></textFieldExpression>
			</textField>
			<textField>
				<reportElement x="100" y="0" width="100" height="20" uuid="1cc185f2-8f51-43c5-bfb5-beebcf35d31d"/>
				<box leftPadding="10">
					<topPen lineWidth="1.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="1.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$F{month}]]></textFieldExpression>
			</textField>
			<textField evaluationTime="Group" evaluationGroup="quaterGroup" isBlankWhenNull="false">
				<reportElement stretchType="RelativeToBandHeight" isPrintRepeatedValues="false" x="300" y="0" width="100" height="20" printWhenGroupChanges="quaterGroup" uuid="5548f039-dd8b-4835-9fd4-ad1a87315a4b">
					<printWhenExpression><![CDATA[$V{quaterGroup_COUNT} == 1]]></printWhenExpression>
				</reportElement>
				<box leftPadding="10">
					<topPen lineWidth="0.0"/>
					<leftPen lineWidth="1.0"/>
					<bottomPen lineWidth="0.0"/>
					<rightPen lineWidth="1.0"/>
				</box>
				<textFieldExpression><![CDATA[$V{qSum}]]></textFieldExpression>
			</textField>
			<line>
				<reportElement x="300" y="0" width="100" height="1" printWhenGroupChanges="quaterGroup" uuid="78d34946-f819-4150-95a7-40f020ddfeef">
					<printWhenExpression><![CDATA[$V{quaterGroup_COUNT} == 1]]></printWhenExpression>
				</reportElement>
			</line>
		</band>
	</detail>
</jasperReport>

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
	<property name="net.sf.jasperreports.export.xls.one.page.per.sheet" value="true"/>
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
	<group name="GroupPobjNombre">
		<groupExpression><![CDATA[$F{pobj_nombre}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<columnHeader>
		<band height="20">
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
			<frame>
				<reportElement x="0" y="0" width="802" height="20" uuid="2cf90c86-66f3-43a6-a4b8-ea194b73222d">
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
				</reportElement>
				<textField>
					<reportElement x="0" y="0" width="80" height="20" uuid="fe616232-8f24-4f03-b331-c3c10db49c0a">
						<property name="com.jaspersoft.studio.unit.x" value="px"/>
						<property name="com.jaspersoft.studio.unit.y" value="px"/>
					</reportElement>
					<box>
						<pen lineWidth="0.5"/>
						<topPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<leftPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<bottomPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<rightPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
					</box>
					<textElement markup="none"/>
					<textFieldExpression><![CDATA["pobj_nombre"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="80" y="0" width="80" height="20" uuid="79550861-ab11-4a3a-b7d5-af281e89bc4b"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["ejecucion_1"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="160" y="0" width="80" height="20" uuid="bdd96ab6-cbcc-4215-8b66-200c727c7945"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["proceso_1"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="240" y="0" width="80" height="20" uuid="cb984d00-0ba2-4649-a896-fc9b5ddc9b21"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["cerrado_1"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="320" y="0" width="80" height="20" uuid="f6b3ece0-31f7-41ed-85bd-9743782ab33f"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["total_1"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="0" width="80" height="20" uuid="52d65814-ac70-4c9a-81eb-9c8206f9abd4"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["ejecucion_2"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="480" y="0" width="80" height="20" uuid="556d730e-59a2-44b4-a7be-5cc838276cf7"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["proceso_2"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="560" y="0" width="80" height="20" uuid="148791b9-ac5c-4934-830b-71260e12d817"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["cerrado_2"]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="640" y="-1" width="80" height="20" uuid="434ea4ba-465e-4ccc-9cb3-c3e6bfe1a6fe"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA["total_2"]]></textFieldExpression>
				</textField>
			</frame>
		</band>
	</columnHeader>
	<detail>
		<band height="20" splitType="Stretch">
			<property name="com.jaspersoft.studio.unit.height" value="px"/>
			<frame>
				<reportElement x="0" y="0" width="802" height="20" uuid="bb07bfe4-fe1b-4f71-9f38-ae1e4449b3a8">
					<property name="com.jaspersoft.studio.unit.height" value="px"/>
				</reportElement>
				<frame>
					<reportElement x="0" y="0" width="80" height="20" uuid="2f01bb14-104d-41b7-8be6-fc501859639f">
						<property name="com.jaspersoft.studio.unit.x" value="px"/>
						<property name="com.jaspersoft.studio.unit.width" value="px"/>
					</reportElement>
					<box>
						<pen lineWidth="0.5"/>
						<topPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<leftPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<bottomPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
						<rightPen lineWidth="0.5" lineStyle="Solid" lineColor="#000000"/>
					</box>
					<textField>
						<reportElement x="0" y="0" width="80" height="20" uuid="9a7896fa-e7f2-4d0e-b55c-588e7f6da48f">
							<property name="com.jaspersoft.studio.unit.x" value="px"/>
							<property name="com.jaspersoft.studio.unit.y" value="px"/>
							<printWhenExpression><![CDATA[$V{GroupPobjNombre_COUNT} == 1]]></printWhenExpression>
						</reportElement>
						<box>
							<pen lineWidth="0.5"/>
							<topPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
							<leftPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
							<bottomPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
							<rightPen lineWidth="0.0" lineStyle="Solid" lineColor="#000000"/>
						</box>
						<textElement markup="none"/>
						<textFieldExpression><![CDATA[$F{pobj_nombre}]]></textFieldExpression>
					</textField>
				</frame>
				<textField>
					<reportElement x="80" y="0" width="80" height="20" uuid="f9b87050-6058-4ae8-9d1b-2828c542452b"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{ejecucion_1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="160" y="0" width="80" height="20" uuid="8c542dff-0f70-4f9b-a246-10fa2f714adc"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{proceso_1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="240" y="0" width="80" height="20" uuid="e29b8e8f-decd-466e-be67-92f3068ad330"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{cerrado_1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="320" y="0" width="80" height="20" uuid="f9a62f4b-3168-4c0a-aa21-ddf5bfa367cc"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{total_1}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="400" y="0" width="80" height="20" uuid="92af1bad-8194-43aa-b0c4-fe062690e821"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{ejecucion_2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="480" y="0" width="80" height="20" uuid="bd70b03e-f3b1-44a0-be19-39b50a38b5c7"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{proceso_2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="560" y="0" width="80" height="20" uuid="34612fa0-9cfb-4e17-b46a-9e98278a871e"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{cerrado_2}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x="640" y="-1" width="80" height="20" uuid="862469b2-4da2-4c17-b500-ff871034252f"/>
					<box>
						<pen lineWidth="0.5"/>
					</box>
					<textFieldExpression><![CDATA[$F{total_2}]]></textFieldExpression>
				</textField>
			</frame>
		</band>
	</detail>
</jasperReport>

```