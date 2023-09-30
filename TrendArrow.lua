function Update()
    arrows = {
        ['Flat'] = "[\\11106]",
        ['SingleUp'] = "[\\11141]",
        ['SingleDown'] = "[\\11143]",
        ['FortyFiveUp'] = "[\\11111]",
        ['FortyFiveDown'] = "[\\11112]",
    }
    MeasureObject = SKIN:GetMeasure('SGVParserBGArrow')
    print(MeasureObject:GetStringValue())
    -- print(MeasureObject:GetValue())

    SKIN:Bang('!SetOption', 'MeterArrow', 'Text', arrows[MeasureObject:GetStringValue()])

end