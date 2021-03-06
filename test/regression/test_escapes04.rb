# -*- coding: utf-8 -*-
require 'helper'

class TestRegressionEscapes04 < Test::Unit::TestCase
  def setup
    setup_dir_var
  end

  def teardown
    File.delete(@xlsx) if File.exist?(@xlsx)
  end

  def test_escapes04
    @xlsx = 'escapes04.xlsx'
    workbook    = WriteXLSX.new(@xlsx)
    worksheet   = workbook.add_worksheet

    worksheet.write_url('A1', 'http://www.perl.com/?a=1&b=2')

    workbook.close
    compare_xlsx_for_regression(
                                File.join(@regression_output, @xlsx),
                                @xlsx,
                                nil,
                                {
                                  'xl/workbook.xml' => ['<workbookView']
                                }
                                )
  end
end
