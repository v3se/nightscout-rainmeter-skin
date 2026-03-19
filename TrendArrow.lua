function Update()
    local arrows = {
        [-1.0] = "[\\11143]",
        [-0.9] = "[\\11143]",
        [-0.8] = "[\\11143]",
        [-0.7] = "[\\11112]",
        [-0.6] = "[\\11112]",
        [-0.5] = "[\\11112]",
        [-0.4] = "[\\11112]",
        [-0.3] = "[\\11106]",
        [-0.2] = "[\\11106]",
        [-0.1] = "[\\11106]",
        [ 0.0] = "[\\11106]",
        [ 0.1] = "[\\11106]",
        [ 0.2] = "[\\11106]",
        [ 0.3] = "[\\11106]",
        [ 0.4] = "[\\11111]",
        [ 0.5] = "[\\11111]",
        [ 0.6] = "[\\11111]",
        [ 0.7] = "[\\11111]",
        [ 0.8] = "[\\11141]",
        [ 0.9] = "[\\11141]",
        [ 1.0] = "[\\11141]",
    }

    local measureObject = SKIN:GetMeasure('MeasureBGDelta')
    local displayDelta = round(measureObject:GetValue(), 1)

    local unitFactor = tonumber(SKIN:GetVariable('unitFactor')) or 0.0555

    -- mmol/L is always used to find the direction of the arrows.
    local arrowDelta = round(displayDelta * (0.0555 / unitFactor), 1)

    if arrowDelta > 1 then
        SKIN:Bang('!SetOption', 'MeterArrow', 'Text', '[\\11141]')
    elseif arrowDelta < -1 then
        SKIN:Bang('!SetOption', 'MeterArrow', 'Text', '[\\11143]')
    else
        SKIN:Bang('!SetOption', 'MeterArrow', 'Text', arrows[arrowDelta] or "[\\11106]")
    end

    if displayDelta > 0 then
        SKIN:Bang('!SetOption', 'MeterBGDelta', 'Text', '+' .. displayDelta)
    else
        SKIN:Bang('!SetOption', 'MeterBGDelta', 'Text', displayDelta)
    end
end

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    if num >= 0 then
        return math.floor(num * mult + 0.5) / mult
    else
        return math.ceil(num * mult - 0.5) / mult
    end
end
