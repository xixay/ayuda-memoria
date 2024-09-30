  @Get('/busqueda-actividades-v2')
  async findAuditoriasInformesV2(@LoggerMethodController() myLogger, @Res() res, @Query() query: GetAllAuditoriasInformesDto) {
    const queryRunner = this.dataSource.createQueryRunner();
    await queryRunner.connect();

    try {
      console.log('findAuditoriasInformes:', query);
      return sendSuccessCustom(queryRunner, res, HttpStatus.OK, 0, 'SE OBTUVIERON DATOS DE FORMA CORRECTA.', await this.conaudService.findAuditoriasInformesV2(query, queryRunner.manager));
>>>>>>> Stashed changes
    } catch (error) {
      return sendErrorCustom(queryRunner, res, HttpStatus.BAD_REQUEST, 0, error.message);
    }
  }
