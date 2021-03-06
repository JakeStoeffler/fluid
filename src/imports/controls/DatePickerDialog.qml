/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import Fluid.Controls 1.0 as FluidControls

/*!
    \qmltype DatePickerDialog
    \inqmlmodule Fluid.Controls
    \ingroup fluidcontrols

    \brief Dialog to select a single date

    Dialog to select a single date from a calendar.

    \code
    import QtQuick 2.10
    import Fluid.Controls 1.0 as FluidControls

    Item {
        width: 600
        height: 600

        Button {
            anchors.centerIn: parent
            text: qsTr("Open")
            onClicked: datePickerDialog.open()
        }

        FluidControls.DatePickerDialog {
            id: datePickerDialog
            onAccepted: {
                console.log(selectedDate);
            }
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        }
    }
    \endcode

    For more information you can read the
    \l{https://material.io/guidelines/components/pickers.html}{Material Design guidelines}.
*/
Dialog {
    id: dialog

    /*!
        \qmlproperty enumeration Fluid.Controls::DatePickerDialog::orientation

        This property holds the date picker orientation.
        The default value is automatically selected based on the device orientation.

        Possible values:
        \value DatePicker.Landscape The date picker is landscape.
        \value DatePicker.Portrait The date picker is portrait.
    */
    property alias orientation: datePicker.orientation

    /*!
        \qmlproperty bool Fluid.Controls::DatePickerDialog::dayOfWeekRowVisible

        This property determines the visibility of the day of week row.
    */
    property alias dayOfWeekRowVisible: datePicker.dayOfWeekRowVisible

    /*!
        \qmlproperty bool Fluid.Controls::DatePickerDialog::weekNumberVisible

        This property determines the visibility of the week number column.
    */
    property alias weekNumberVisible: datePicker.weekNumberVisible

    /*!
        \qmlproperty date Fluid.Controls::DatePickerDialog::from

        This property holds the start date.
    */
    property alias from: datePicker.from

    /*!
        \qmlproperty date Fluid.Controls::DatePickerDialog::to

        This property holds the end date.
    */
    property alias to: datePicker.to

    /*!
        \qmlproperty date Fluid.Controls::DatePickerDialog::selectedDate

        This property holds the date that has been selected by the user.
        The default value is the current date.
    */
    property alias selectedDate: datePicker.selectedDate

    /*!
        \qmlproperty list<Object> Fluid.Controls::DatePickerDialog::standardButtonsContainer

        This property allows you to place additional buttons alongside the standard buttons
        of the dialog, like in this example:

        \code
        FluidControls.DatePickerDialog {
            id: datePickerDialog
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            standardButtonsContainer: Button {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Today")
                flat: true
                onClicked: datePickerDialog.selectedDate = new Date()
            }
        }
        \endcode
    */
    property alias standardButtonsContainer: buttonBox.data

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    padding: 0
    margins: 0
    topMargin: 0
    topPadding: 0
    modal: true

    header.visible: false
    footer.visible: false

    FluidControls.DatePicker {
        id: datePicker
        footer: DialogButtonBox {
            id: buttonBox
            padding: 0
            standardButtons: dialog.standardButtons
            onAccepted: dialog.accept()
            onRejected: dialog.reject()

            Material.background: "transparent"
        }
    }
}
