
-- Custom 
local CARD_WIDTH = script:GetCustomProperty("CardWidth")
local CARD_HEIGHT = script:GetCustomProperty("CardHeight")
local SCREEN_SHOT_URL = script:GetCustomProperty("ScreenShotURL")
-- Custom 
local CARD = script:GetCustomProperty("Card")
local UIIMAGE = script:GetCustomProperty("UIImage"):WaitForObject() ---@type UIImage

local ROWS, COLS = 4


function ShowCard()
    UIIMAGE:SetColor(Color.WHITE)
    SetScreenshot()
    local xTranslation = math.floor(CARD/4)*CARD_WIDTH
    local yTranslation = (CARD % 4)*CARD_HEIGHT
    UIIMAGE.x = -xTranslation
    UIIMAGE.y = yTranslation
end

function SetScreenshot()
    local screenshotIndex = math.floor(CARD/16) + 1
    UIIMAGE:SetGameScreenshot(SCREEN_SHOT_URL, screenshotIndex)
end

ShowCard()

Task.Wait()
CARD.customPropertyChangedEvent:Connect(ShowCard)