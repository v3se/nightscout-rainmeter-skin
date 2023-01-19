function Update()
    MeasureObject = SKIN:GetMeasure('SGVParserBGDate')
    MeasureBGDate = MeasureObject:GetValue()
    diff_minutes = math.floor((os.time() - tonumber(tostring(MeasureBGDate):sub(1, 10))) / 60)
    -- print(os.date(_, tostring(MeasureBGDate):sub(1, 10)))
    -- print(os.time(),tonumber(tostring(MeasureBGDate):sub(1, 10)),diff_minutes)
    SKIN:Bang('!SetOption', 'MeterDate', 'Text', diff_minutes .. ' minutes ago')
end