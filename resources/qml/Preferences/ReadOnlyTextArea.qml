// Copyright (c) 2016 Ultimaker B.V.
// Uranium is released under the terms of the AGPLv3 or higher.

import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.2

Item
{
    id: base

    property alias text: textArea.text
    property alias wrapMode: textArea.wrapMode

    signal editingFinished();

    property bool readOnly: false

    width: textArea.width
    height: textArea.height

    TextArea
    {
        id: textArea

        enabled: !base.readOnly
        opacity: base.readOnly ? 0.5 : 1.0

        anchors.fill: parent

        onEditingFinished: base.editingFinished()
    }

    Label
    {
        visible: base.readOnly
        text: textArea.text

        anchors.fill: parent
        anchors.margins: textArea.__style ? textArea.__style.textMargin : 4

        color: palette.buttonText
    }

    SystemPalette { id: palette }
}
