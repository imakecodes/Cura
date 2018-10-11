// Copyright (c) 2018 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Controls 1.1

import UM 1.4 as UM
import Cura 1.1 as Cura

import "../components"

Row
{
    spacing: UM.Theme.getSize("default_margin").width

    ActionButton
    {
        width: UM.Theme.getSize("account_button").width
        height: UM.Theme.getSize("account_button").height
        text: catalog.i18nc("@button", "Create account")
        color: UM.Theme.getColor("secondary")
        hoverColor: UM.Theme.getColor("secondary")
        textColor: UM.Theme.getColor("text_link")
        textHoverColor: UM.Theme.getColor("text")
        onClicked: Qt.openUrlExternally("https://account.ultimaker.com")
    }

    ActionButton
    {
        width: UM.Theme.getSize("account_button").width
        height: UM.Theme.getSize("account_button").height
        text: catalog.i18nc("@button", "Login")
        onClicked: Cura.API.account.login()
    }
}