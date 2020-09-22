local httpService = game:GetService("HttpService")
local workspace = game:GetService("Workspace")

print("TEST2")

local files = {
    PropMarkers = {
        Change = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/PropMarkers/Change.lua",
        Children = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/PropMarkers/Children.lua",
        Event = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/PropMarkers/Event.lua",
        Ref = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/PropMarkers/Ref.lua"
    },
    Binding = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Binding.lua",
    Component = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Component.lua",
    ComponentLifecyclePhase = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/ComponentLifecyclePhase.lua",
    Config = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Config.lua",
    ElementKind = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/ElementKind.lua",
    ElementUtils = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/ElementUtils.lua",
    GlobalConfig = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/GlobalConfig.lua",
    Logging = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Logging.lua",
    None = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/None.lua",
    NoopRenderer = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/NoopRenderer.lua",
    Portal = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Portal.lua",
    PureComponent = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/PureComponent.lua",
    RobloxRenderer = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/RobloxRenderer.lua",
    SingleEventManager = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/SingleEventManager.lua",
    Symbol = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Symbol.lua",
    Type = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/Type.lua",
    assertDeepEqual = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/assertDeepEqual.lua",
    assign = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/assign.lua",
    createContext = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createContext.lua",
    createElement = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createElement.lua",
    createFragment = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createFragment.lua",
    createReconciler = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createReconciler.lua",
    createReconcilerCompat = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createReconcilerCompat.lua",
    createRef = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createRef.lua",
    createSignal = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createSignal.lua",
    createSpy = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/createSpy.lua",
    getDefaultInstanceProperty = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/getDefaultInstanceProperty.lua",
    internalAssert = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/internalAssert.lua",
    invalidSetStateMessages = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/invalidSetStateMessages.lua",
    oneChild = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/oneChild.lua",
    strict = "https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/strict.lua"
}

function installRoact()
    print("TEST")

    local f = workspace:FindFirstChild("RobloxPKG")
    if (f ~= nil) then
        print("Downloading & installing Roact.")

        local main = httpService:GetAsync("https://raw.githubusercontent.com/Roblox/roact/v1.3.0/src/init.lua")
        local module = Instance.new("ModuleScript")
        module.Name = "Roact"
        module.Source = main
        
        -- Download the rest of the files.
        local function installFiles(parent, tbl)
            for i, v in pairs(tbl) do
                if (typeof(v) == "table") then
                    local x = Instance.new("Folder")
                    x.Name = i
                    x.Parent = parent
                    installFiles(x, v)
                else
                    local m = Instance.new("ModuleScript")
                    m.Name = i
                    m.Source = httpService:GetAsync(v)
                    m.Parent = parent
                end
            end
        end

        installFiles(module, files)

        module.Parent = f
    end
end

installRoact()