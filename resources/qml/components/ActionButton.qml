// Copyright (c) 2018 Ultimaker B.V.
// Cura is released under the terms of the LGPLv3 or higher.

import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

import UM 1.1 as UM

Button
{
    id: button
    property alias cursorShape: mouseArea.cursorShape
    property var iconSource: ""
    property var color: UM.Theme.getColor("primary")
    property var hoverColor: UM.Theme.getColor("primary_hover")
    property var disabledColor: color
    property var textColor: UM.Theme.getColor("button_text")
    property var textHoverColor: UM.Theme.getColor("button_text_hover")
    property var textDisabledColor: textColor
    property var textFont: UM.Theme.getFont("action_button")
    property var cornerRadius: 2 * screenScaleFactor

    contentItem: Row
    {
        UM.RecolorImage
        {
            id: buttonIcon
            source: button.iconSource
            width: 16 * screenScaleFactor
            height: 16 * screenScaleFactor
            sourceSize.width: width
            sourceSize.height: height
            color: button.hovered ? button.textHoverColor : button.textColor
            visible: button.iconSource != ""
            anchors.verticalCenter: parent.verticalCenter
        }

        Label
        {
            id: buttonText
            text: button.text
            color: button.enabled ? (button.hovered ? button.textHoverColor : button.textColor): button.textDisabledColor
            font: button.textFont
            visible: button.text != ""
            renderType: Text.NativeRendering
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    background: Rectangle
    {
        color: button.enabled ? (button.hovered ? button.hoverColor : button.color) : button.disabledColor
        radius: cornerRadius
    }

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        onPressed: mouse.accepted = false
        hoverEnabled: true
        cursorShape: button.enabled ? (hovered ? Qt.PointingHandCursor : Qt.ArrowCursor) : Qt.ForbiddenCursor
    }
}
