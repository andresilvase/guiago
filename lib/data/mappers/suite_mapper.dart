import 'package:guiago/core/domain/suites.dart';
import 'package:guiago/data/dto/suite_discount.dart';
import 'package:guiago/data/dto/suite_items.dart';
import 'package:guiago/data/dto/suite_items_category.dart';
import 'package:guiago/data/dto/suite_periods.dart';
import 'package:guiago/data/dto/suites.dart';

class SuitesMapper {
  static Suites fromDTO(SuitesDTO dto) {
    return Suites(
      categoriaItens: dto.categoriaItens?.map((s) => SuitesMapper.suiteCategoriaItemsFromDTO(s)).toList(),
      periodos: dto.periodos?.map((s) => SuitesMapper.suitePeriodsFromDTO(s)).toList(),
      itens: dto.itens?.map((s) => SuitesMapper.suiteItemsFromDTO(s)).toList(),
      exibirQtdDisponiveis: dto.exibirQtdDisponiveis,
      fotos: dto.fotos,
      nome: dto.nome,
      qtd: dto.qtd,
    );
  }

  static SuiteCategoriaItem suiteCategoriaItemsFromDTO(SuiteCategoriaItemsDTO dto) {
    return SuiteCategoriaItem(
      nome: dto.nome,
      icone: dto.icone,
    );
  }

  static SuiteItem suiteItemsFromDTO(SuiteItemsDTO dto) {
    return SuiteItem(
      nome: dto.nome,
    );
  }

  static SuitePeriods suitePeriodsFromDTO(SuitePeriodsDTO dto) {
    return SuitePeriods(
      desconto: suiteDiscountFromDTO(dto.desconto),
      tempoFormatado: dto.tempoFormatado,
      valorTotal: dto.valorTotal,
      temCortesia: dto.temCortesia,
      tempo: dto.tempo,
      valor: dto.valor,
    );
  }

  static SuiteDiscount suiteDiscountFromDTO(SuiteDiscountDTO? dto) {
    return SuiteDiscount(
      desconto: dto?.desconto,
    );
  }

  static SuitesDTO toDTO(Suites domain) {
    return SuitesDTO(
      categoriaItens: domain.categoriaItens?.map((s) => SuitesMapper.suiteCategoriaItemsToDTO(s)).toList(),
      periodos: domain.periodos?.map((s) => SuitesMapper.suitePeriodsToDTO(s)).toList(),
      itens: domain.itens?.map((s) => SuitesMapper.suiteItemsToDTO(s)).toList(),
      exibirQtdDisponiveis: domain.exibirQtdDisponiveis,
      fotos: domain.fotos,
      nome: domain.nome,
      qtd: domain.qtd,
    );
  }

  static SuiteCategoriaItemsDTO suiteCategoriaItemsToDTO(SuiteCategoriaItem domain) {
    return SuiteCategoriaItemsDTO(
      nome: domain.nome,
      icone: domain.icone,
    );
  }

  static SuiteItemsDTO suiteItemsToDTO(SuiteItem domain) {
    return SuiteItemsDTO(
      nome: domain.nome,
    );
  }

  static SuitePeriodsDTO suitePeriodsToDTO(SuitePeriods domain) {
    return SuitePeriodsDTO(
      desconto: suiteDiscountToDTO(domain.desconto),
      tempoFormatado: domain.tempoFormatado,
      valorTotal: domain.valorTotal,
      temCortesia: domain.temCortesia,
      tempo: domain.tempo,
      valor: domain.valor,
    );
  }

  static SuiteDiscountDTO suiteDiscountToDTO(SuiteDiscount? domain) {
    return SuiteDiscountDTO(
      desconto: domain?.desconto,
    );
  }
}
