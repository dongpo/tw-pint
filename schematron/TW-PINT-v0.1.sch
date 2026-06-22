<?xml version="1.0" encoding="UTF-8"?>
<sch:schema
    xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    queryBinding="xslt2">

  <sch:title>TW-PINT v0.1 Schematron</sch:title>

  <sch:ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
  <sch:ns prefix="cn"  uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
  <sch:ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <sch:ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>

  <!--
    TW-PINT v0.1
    Status: Non-official working draft for review.
    Source: TW-PINT-Rules-Catalogue-v0.1.xlsx.
    Scope: UBL 2.1 Invoice first. CreditNote parallel rules are reserved for v0.2.
  -->

  <sch:pattern id="TW-PINT-A-Specification">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-001" flag="fatal" test="exists(cbc:CustomizationID)">
        TW-IBR-001: Specification Identifier SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-002" flag="fatal" test="normalize-space(cbc:CustomizationID) = 'urn:peppol:pint:billing-1@tw-1'">
        TW-IBR-002: Specification Identifier SHALL be urn:peppol:pint:billing-1@tw-1.
      </sch:assert>

      <sch:assert id="TW-IBR-003" flag="fatal" test="exists(cbc:CustomizationID)">
        TW-IBR-003: Customization Identifier SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-004" flag="fatal" test="exists(cbc:ProfileID)">
        TW-IBR-004: Profile Identifier SHALL exist.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-B-Invoice-Identification">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-006" flag="fatal" test="exists(cbc:ID)">
        TW-IBR-006: Invoice Number SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-007" flag="fatal" test="matches(normalize-space(cbc:ID),'^[A-Z]{2}[0-9]{8}$')">
        TW-IBR-007: Taiwan Invoice Number SHALL match two uppercase letters plus eight digits.
      </sch:assert>

      <sch:assert id="TW-IBR-008" flag="fatal" test="exists(cbc:IssueDate)">
        TW-IBR-008: Invoice Issue Date SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-009" flag="warning" test="not(cbc:IssueDate) or xs:date(cbc:IssueDate) le current-date()">
        TW-IBR-009: Invoice Issue Date SHOULD NOT be in the future.
      </sch:assert>

      <sch:assert id="TW-IBR-010" flag="fatal" test="exists(cbc:InvoiceTypeCode)">
        TW-IBR-010: Invoice Type Code SHALL exist.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-C-Seller">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-011" flag="fatal" test="exists(cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)">
        TW-IBR-011: Seller Name SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-012" flag="fatal" test="exists(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID)">
        TW-IBR-012: Seller UBN SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-013" flag="fatal" test="matches(normalize-space(cac:AccountingSupplierParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID),'^[0-9]{8}$')">
        TW-IBR-013: Seller UBN SHALL contain 8 digits.
      </sch:assert>

      <sch:assert id="TW-IBR-014" flag="fatal" test="exists(cac:AccountingSupplierParty/cac:Party/cbc:EndpointID)">
        TW-IBR-014: Seller Endpoint Identifier SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-015" flag="fatal" test="exists(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)">
        TW-IBR-015: Seller Country Code SHALL exist.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-D-Buyer">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-016" flag="fatal" test="exists(cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName)">
        TW-IBR-016: Buyer Name SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-017" flag="fatal" test="exists(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID)">
        TW-IBR-017: Buyer UBN SHALL exist for domestic B2B transactions.
      </sch:assert>

      <sch:assert id="TW-IBR-018" flag="fatal" test="matches(normalize-space(cac:AccountingCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:CompanyID),'^[0-9]{8}$')">
        TW-IBR-018: Buyer UBN SHALL contain 8 digits.
      </sch:assert>

      <sch:assert id="TW-IBR-019" flag="fatal" test="exists(cac:AccountingCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode)">
        TW-IBR-019: Buyer Country Code SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-020" flag="warning" test="exists(cac:AccountingCustomerParty/cac:Party/cbc:EndpointID)">
        TW-IBR-020: Buyer Endpoint Identifier SHOULD exist.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-E-Currency">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-021" flag="fatal" test="exists(cbc:DocumentCurrencyCode)">
        TW-IBR-021: Invoice Currency Code SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-022" flag="fatal" test="string-length(normalize-space(cbc:DocumentCurrencyCode)) = 3">
        TW-IBR-022: Invoice Currency SHALL be ISO 4217 alpha-3 format.
      </sch:assert>

      <sch:assert id="TW-IBR-023" flag="warning" test="not(cbc:TaxCurrencyCode) or normalize-space(cbc:TaxCurrencyCode)='TWD'">
        TW-IBR-023: Tax Currency SHOULD be TWD for domestic invoices.
      </sch:assert>

      <sch:assert id="TW-IBR-024" flag="fatal" test="not(cbc:TaxCurrencyCode) or string-length(normalize-space(cbc:TaxCurrencyCode)) = 3">
        TW-IBR-024: Tax Currency SHALL be ISO 4217 alpha-3 format.
      </sch:assert>

      <sch:assert id="TW-IBR-025" flag="fatal" test="cac:LegalMonetaryTotal/cbc:PayableAmount/@currencyID = cbc:DocumentCurrencyCode">
        TW-IBR-025: Payable Amount currency SHALL equal Invoice Currency.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-F-Tax-Line">
    <sch:rule context="/ubl:Invoice/cac:InvoiceLine">
      <sch:assert id="TW-IBR-026" flag="fatal" test="exists(cac:Item/cac:ClassifiedTaxCategory/cbc:ID)">
        TW-IBR-026: Tax Category SHALL exist for each invoice line.
      </sch:assert>

      <sch:assert id="TW-IBR-027" flag="fatal" test="cac:Item/cac:ClassifiedTaxCategory/cbc:ID = ('S','Z','E')">
        TW-IBR-027: Tax Category SHALL be one of S, Z, E.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[cbc:ID='S']">
      <sch:assert id="TW-IBR-028" flag="fatal" test="number(cbc:Percent)=5">
        TW-IBR-028: Taxable category S SHALL use rate 5%.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[cbc:ID='Z']">
      <sch:assert id="TW-IBR-029" flag="fatal" test="number(cbc:Percent)=0">
        TW-IBR-029: Zero-rated category Z SHALL use rate 0%.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:InvoiceLine/cac:Item/cac:ClassifiedTaxCategory[cbc:ID='E']">
      <sch:assert id="TW-IBR-030" flag="fatal" test="number(cbc:Percent)=0">
        TW-IBR-030: Exempt category E SHALL use rate 0%.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-F-Tax-Breakdown">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-032" flag="fatal" test="exists(cac:TaxTotal/cac:TaxSubtotal)">
        TW-IBR-032: Tax Breakdown SHALL exist.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:TaxTotal">
      <sch:assert id="TW-IBR-033" flag="fatal" test="round(number(cbc:TaxAmount) * 100) = round(sum(cac:TaxSubtotal/cbc:TaxAmount) * 100)">
        TW-IBR-033: Tax Total SHALL equal sum of Tax Subtotals.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal">
      <sch:assert id="TW-IBR-034" flag="fatal" test="number(cbc:TaxableAmount) &gt;= 0">
        TW-IBR-034: Taxable Amount SHALL be greater than or equal to 0.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory">
      <sch:assert id="TW-IBR-035" flag="fatal" test="number(cbc:Percent) &gt;= 0">
        TW-IBR-035: Tax Rate SHALL be greater than or equal to 0.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cbc:ID='E']">
      <sch:assert id="TW-IBR-031" flag="fatal" test="number(cbc:TaxAmount)=0">
        TW-IBR-031: Tax Amount SHALL be 0 when category E is used.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-G-Monetary-Totals">
    <sch:rule context="/ubl:Invoice/cac:LegalMonetaryTotal">
      <sch:assert id="TW-IBR-036" flag="fatal" test="exists(cbc:LineExtensionAmount)">
        TW-IBR-036: Line Extension Amount SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-037" flag="fatal" test="exists(cbc:TaxExclusiveAmount)">
        TW-IBR-037: Tax Exclusive Amount SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-038" flag="fatal" test="exists(cbc:TaxInclusiveAmount)">
        TW-IBR-038: Tax Inclusive Amount SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-039" flag="fatal" test="exists(cbc:PayableAmount)">
        TW-IBR-039: Payable Amount SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-040" flag="fatal"
        test="round(number(cbc:PayableAmount) * 100) =
              round((number(cbc:TaxInclusiveAmount)
              - (if (cbc:PrepaidAmount) then number(cbc:PrepaidAmount) else 0)
              + (if (cbc:PayableRoundingAmount) then number(cbc:PayableRoundingAmount) else 0)) * 100)">
        TW-IBR-040: Payable Amount SHALL equal Tax Inclusive Amount - Prepaid Amount + Rounding Amount.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-H-Invoice-Lines">
    <sch:rule context="/ubl:Invoice">
      <sch:assert id="TW-IBR-041" flag="fatal" test="exists(cac:InvoiceLine)">
        TW-IBR-041: Invoice SHALL contain at least one Invoice Line.
      </sch:assert>
    </sch:rule>

    <sch:rule context="/ubl:Invoice/cac:InvoiceLine">
      <sch:assert id="TW-IBR-042" flag="fatal" test="exists(cbc:ID)">
        TW-IBR-042: Invoice Line Identifier SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-043" flag="fatal" test="exists(cbc:InvoicedQuantity)">
        TW-IBR-043: Invoice Line Quantity SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-044" flag="fatal" test="exists(cac:Price/cbc:PriceAmount)">
        TW-IBR-044: Invoice Line Unit Price SHALL exist.
      </sch:assert>

      <sch:assert id="TW-IBR-045" flag="fatal" test="exists(cbc:LineExtensionAmount)">
        TW-IBR-045: Invoice Line Net Amount SHALL exist.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="TW-PINT-I-Cross-Border-Reserved">
    <!--
      TW-IBR-046~048 are reserved in v0.1 because export invoice classification
      and destination-country mapping need to be finalized before executable
      Schematron assertions are safe.
    -->
  </sch:pattern>

  <sch:pattern id="TW-PINT-J-Validation-Integrity-Reserved">
    <!--
      TW-IBR-049: code-list validation should be executed with genericode/code-list validator.
      TW-IBR-050: PINT shared rules must be executed as a separate validation layer.
    -->
  </sch:pattern>

</sch:schema>
