Feature: chart_data properties
  In order to compose data for a chart
  As a developer using python-pptx
  I need chart data transfer objects


  Scenario: CategoryChartData.categories getter
    Given a CategoryChartData object
     Then chart_data.categories is a Categories object


  Scenario: CategoryChartData.categories setter
    Given a CategoryChartData object
     When I assign ['a', 'b', 'c'] to chart_data.categories
     Then [c.name for c in chart_data.categories] is ['a', 'b', 'c']


  Scenario: CategoryChartData.add_category()
    Given a CategoryChartData object
     Then chart_data.add_category(name) is a Category object
      And chart_data.categories[-1] is the category


  Scenario: CategoryChartData.add_series()
    Given a CategoryChartData object
     Then chart_data.add_series(name, values) is a CategorySeriesData object
      And chart_data[-1] is the new series


  Scenario: Category.add_sub_category()
    Given a Category object
     Then category.add_sub_category(name) is a Category object
      And category.sub_categories[-1] is the new category


  @wip
  Scenario Outline: CategoryChartData number format
    Given a CategoryChartData object with number format <cht-nf>
     When I add a series with number format <ser-nf>
      And I add a data point with number format <dp-nf>
     Then chart_data.number_format is <cht-val>
      And series_data.number_format is <ser-val>
      And data_point.number_format is <dp-val>

    Examples: number format inheritance states
      | cht-nf | ser-nf | dp-nf | cht-val | ser-val | dp-val  |
      | None   | None   | None  | General | General | General |
      | None   | None   | 42    | General | General | 42      |
      | None   | 42     | None  | General | 42      | 42      |
      | None   | 42     | 24    | General | 42      | 24      |
      | 42     | None   | None  | 42      | 42      | 42      |
      | 42     | None   | 24    | 42      | 42      | 24      |
      | 42     | 24     | None  | 42      | 24      | 24      |
      | 42     | 24     | 12    | 42      | 24      | 12      |