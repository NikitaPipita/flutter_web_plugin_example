//Declares a global function
window.jsInvokeMethod = async (method, params) => {
    //Process your Dart call here
    console.log('Handled call from Dart\nmethod: ' + method + '\nparams: ' + params)
    await delay(1000)
    callDart('Imitating Dart call from JS')
    return 'Response from JS'
}

//Sends event to Dart
function callDart(event) {
    delay(3000).then(_ => {
            window.jsOnEvent(event)
        }
    )
}

const delay = ms => new Promise(res => setTimeout(res, ms));
