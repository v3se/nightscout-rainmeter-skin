function Update()
    MeasureObject = SKIN:GetMeasure('SGVParserBGDate')
    MeasureBGDate = MeasureObject:GetValue()
    SKIN:Bang('!SetOption', 'MeterDate', 'Text', os.date(_, tostring(MeasureBGDate):sub(1, 10)))
end