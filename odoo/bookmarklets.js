// Debug Assets mode
javascript:(function () { let url = new URL(window.location.href);url.searchParams.set('debug', 'assets');window.location.href = url.toString()})()

// Login
javascript:(function () { const LOGIN_PATH = "/web/login"; if (location.pathname !== LOGIN_PATH) { location.pathname = LOGIN_PATH } else { const form = document.querySelector(".oe_login_form"); for (let field of ["login", "password"]) { form[field].value = "admin" };form.submit() } })()

// Server version
javascript:(function () { fetch(`${new URL(window.location.href).origin}/web/webclient/version_info`,{headers:{"Content-Type":"application/json",},referrerPolicy:"strict-origin-when-cross-origin",body:JSON.stringify({jsonrpc:"2.0",method:"call",id:"21321",params:{},}),method:"POST",}).then((response)=>response.json()).then(({result})=>{alert(`Odoo Version ${result.server_version}`);}).catch(()=>{alert('Cannot find Odoo Version');}) })()

// Database list
javascript:(function () { fetch(`${new URL(window.location.href).origin}/web/database/list`,{headers:{"Content-Type":"application/json",},referrerPolicy:"strict-origin-when-cross-origin",body:JSON.stringify({jsonrpc:"2.0",method:"call",id:"21321",params:{},}),method:"POST",}).then((response)=>response.json()).then(({result})=>{alert(`Databases: ${result}`);}).catch(()=>{alert('Cannot find Odoo Databases');}) })()

