/*
c 2023-09-26
m 2023-11-25
*/

[Setting hidden]
bool ghosts_pp = false;
bool ghosts_pp_already = ghosts_pp;

string title = "XertroVerrider";

[Setting category="General" name="Enabled"]
bool S_Enabled = true;

void RenderMenu() {
    if (UI::MenuItem(title, "", S_Enabled))
        S_Enabled = !S_Enabled;
}

void Main() { }

import void OverrideGameSafetyCheck_GhostsPP() from "Ghosts_PP";

void Render() {
    if (!S_Enabled)
        return;

    UI::Begin(title, S_Enabled, UI::WindowFlags::None);
        ghosts_pp = UI::Checkbox("Ghosts++ ", ghosts_pp);
        if (ghosts_pp && !ghosts_pp_already) {
            try {
                OverrideGameSafetyCheck_GhostsPP();
                ghosts_pp_already = true;
            } catch {
                print("unbound function");
                ghosts_pp = false;
            }
        }
    UI::End();
}