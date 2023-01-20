function Update()
    arrows = {
        [-1] = "[\\11143]",
        [-0.9] = "[\\11143]",
        [-0.8] = "[\\11143]",
        [-0.7] = "[\\11112]",
        [-0.6] = "[\\11112]",
        [-0.5] = "[\\11112]",
        [-0.4] = "[\\11112]",
        [-0.3] = "[\\11106]",
        [-0.2] = "[\\11106]",
        [-0.1] = "[\\11106]",
        [0] = "[\\11106]",
        [0.1] = "[\\11106]",
        [0.2] = "[\\11106]",
        [0.3] = "[\\11106]",
        [0.4] = "[\\11111]",
        [0.5] = "[\\11111]",
        [0.6] = "[\\11111]",
        [0.7] = "[\\11111]",
        [0.8] = "[\\11141]",
        [0.9] = "[\\11141]",
        [1] = "[\\11141]",
    }
    MeasureObject = SKIN:GetMeasure('MeasureBGDelta')
	MeasureBGDelta = round(MeasureObject:GetValue(), 1)
    -- print('Rounded Glucose: ' .. MeasureBGDelta)
    -- print(MeasureObject:GetValue())
    if MeasureBGDelta > 1
    then
        SKIN:Bang('!SetOption', 'MeterArrow', 'Text', '[\\11141]')
    elseif MeasureBGDelta < -1
    then
        SKIN:Bang('!SetOption', 'MeterArrow', 'Text', '[\\11143]')
    else
        print(arrows[MeasureBGDelta])
        SKIN:Bang('!SetOption', 'MeterArrow', 'Text', arrows[MeasureBGDelta])
    end

    if MeasureBGDelta > 0
    then
        SKIN:Bang('!SetOption', 'MeterBGDelta', 'Text', '+' .. MeasureBGDelta)
    else
        SKIN:Bang('!SetOption', 'MeterBGDelta', 'Text', MeasureBGDelta)
    end
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end