local script_input = ""
local logs = {}
local auto_exec = false
local theme_dark = true

function AddLog(text)
    table.insert(logs, text)
    if #logs > 50 then
        table.remove(logs, 1)
    end
end

function DrawGUI()
    if theme_dark then
        imgui.StyleColorsDark()
    else
        imgui.StyleColorsLight()
    end

    imgui.SetNextWindowSize(800, 600, imgui.Cond.Once)
    if imgui.Begin("Delta Executor - CoolGUI by Gardaş") then
        if imgui.BeginTabBar("Tabs") then

            if imgui.BeginTabItem("Script") then
                -- script_input buffer olarak table veya string olabilir
                local changed, new_text = imgui.InputTextMultiline("##script_input", script_input, 10240, imgui.ImVec2(-1, 200))
                if changed then
                    script_input = new_text
                end

                if imgui.Button("Run") then
                    AddLog("Script çalıştırıldı!")
                    -- run_script(script_input) -- buraya executorun run fonksiyonunu koy
                end
                imgui.SameLine()
                if imgui.Button("Clear") then
                    script_input = ""
                end

                imgui.EndTabItem()
            end

            if imgui.BeginTabItem("Settings") then
                local changed
                changed, auto_exec = imgui.Checkbox("Auto Execute", auto_exec)

                changed, theme_dark = imgui.Checkbox("Dark Theme", theme_dark)

                imgui.EndTabItem()
            end

            if imgui.BeginTabItem("Logs") then
                imgui.BeginChild("log_area", imgui.ImVec2(-1, 200), true)
                for i, v in ipairs(logs) do
                    imgui.Text(v)
                end
                imgui.EndChild()
                imgui.EndTabItem()
            end

            imgui.EndTabBar()
        end
    end
    imgui.End()
end

-- Bu fonksiyonu executorun event loop’unda veya frame callback’inde çağır
function main_loop()
    imgui.NewFrame()

    DrawGUI()

    imgui.Render()
    -- platforma göre render çağrısı yapılmalı (ör. ImGui_ImplDX11_RenderDrawData)
    -- burada örnek, executorunu kullanacaksın
end
