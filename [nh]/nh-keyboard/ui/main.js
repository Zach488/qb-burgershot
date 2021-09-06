var RowsData = [];
var Rows = [];
var saved = "";

const OpenMenu = (data) => {
    $(`.main-wrapper`).fadeIn(0)
    $(`.background`).fadeIn(0)
    SetHeader(data.header)
    AddRow(data.rows)
}

function SetHeader(header) {
    var element
    element = $('<h1>' + header + '<h1>');
    $('.heading').append(element);
    saved = element
}

const CloseMenu = () => {
    $(`.main-wrapper`).fadeOut(0);
    $(`.background`).fadeOut(0);
    $(saved).remove();
    RowsData = [];
    Rows = [];
    saved = "";
};

function AddRow(data) {
    RowsData = data
    for (var i = 0; i < RowsData.length; i++) {
        var message = RowsData[i].txt
        var id = RowsData[i].id
        var element

        element = $('<label for="usr">' + message + '</label> <input type="text" class="form-control" id="' + id + '" />');
        $('.body').append(element);
        Rows[id] = element
    }
    setTimeout(() => {
        document.getElementById(0).focus();
    }, 100);
}

$(`#submit`).click(() => {
    SubmitData();
})


function SubmitData() {
    const returnData = [];
    for (var i = 0; i < RowsData.length; i++) {
        var id = RowsData[i].id
        var data = document.getElementById(id)
        if (data.value) {
            returnData.push({
                _id: id,
                input: data.value,
            });
        } else {
            returnData.push({
                _id: id,
                input: null,
            });
        }
        $(Rows[id]).remove();
    }
    PostData({
        data: returnData
    })
    CloseMenu();
}


const PostData = (data) => {
    return $.post(`https://nh-keyboard/dataPost`, JSON.stringify(data))
}

const CancelMenu = () => {
    for (var i = 0; i < RowsData.length; i++) {
        var id = RowsData[i].id
        $(Rows[id]).remove();
    }
    $.post(`https://nh-keyboard/cancel`)
    return CloseMenu();
}

window.addEventListener("message", (evt) => {
    const data = evt.data
    const info = data.data
    const action = data.action
    switch (action) {
        case "OPEN_MENU":
            return OpenMenu(info);
        case "CLOSE_MENU":
            return CloseMenu();
        default:
            return;
    }
})


document.onkeyup = function (event) {
    event = event || window.event;
    var charCode = event.keyCode || event.which;
    if (charCode == 27) {
        CancelMenu();
    } else if (charCode == 13) {
        SubmitData()
    }
};

$(document).click(function (event) {
    var $target = $(event.target);
    if (!$target.closest('.main-wrapper').length &&
        $('.main-wrapper').is(":visible")) {
        CancelMenu();
    }
});