/*
 Highcharts JS v9.2.2 (2021-08-24)

 Client side exporting module

 (c) 2015-2021 Torstein Honsi / Oystein Moseng

 License: www.highcharts.com/license
*/
'use strict';
(function(a) {
    "object" === typeof module && module.exports ? (a["default"] = a, module.exports = a) : "function" === typeof define && define.amd ? define("highcharts/modules/offline-exporting", ["highcharts", "highcharts/modules/exporting"], function(k) {
        a(k);
        a.Highcharts = k;
        return a
    }) : a("undefined" !== typeof Highcharts ? Highcharts : void 0)
})(function(a) {
    function k(a, t, d, r) {
        a.hasOwnProperty(t) || (a[t] = r.apply(null, d))
    }
    a = a ? a._modules : {};
    k(a, "Extensions/DownloadURL.js", [a["Core/Globals.js"]], function(a) {
        var t = a.isSafari,
            d = a.win,
            r = d.document,
            l = d.URL || d.webkitURL || d,
            k = a.dataURLtoBlob = function(a) {
                if ((a = a.replace(/filename=.*;/, "").match(/data:([^;]*)(;base64)?,([0-9A-Za-z+/]+)/)) && 3 < a.length && d.atob && d.ArrayBuffer && d.Uint8Array && d.Blob && l.createObjectURL) {
                    var e = d.atob(a[3]),
                        m = new d.ArrayBuffer(e.length);
                    m = new d.Uint8Array(m);
                    for (var b = 0; b < m.length; ++b) m[b] = e.charCodeAt(b);
                    a = new d.Blob([m], {
                        type: a[1]
                    });
                    return l.createObjectURL(a)
                }
            };
        a = a.downloadURL = function(a, l) {
            var m = d.navigator,
                b = r.createElement("a");
            if ("string" ===
                typeof a || a instanceof String || !m.msSaveOrOpenBlob) {
                a = "" + a;
                m = /Edge\/\d+/.test(m.userAgent);
                if (t && "string" === typeof a && 0 === a.indexOf("data:application/pdf") || m || 2E6 < a.length)
                    if (a = k(a) || "", !a) throw Error("Failed to convert to blob");
                if ("undefined" !== typeof b.download) b.href = a, b.download = l, r.body.appendChild(b), b.click(), r.body.removeChild(b);
                else try {
                    var e = d.open(a, "chart");
                    if ("undefined" === typeof e || null === e) throw Error("Failed to open window");
                } catch (L) {
                    d.location.href = a
                }
            } else m.msSaveOrOpenBlob(a,
                l)
        };
        return {
            dataURLtoBlob: k,
            downloadURL: a
        }
    });
    k(a, "Extensions/OfflineExporting/OfflineExportingDefaults.js", [], function() {
        return {
            libURL: "https://code.highcharts.com/9.2.2/lib/",
            menuItemDefinitions: {
                downloadPNG: {
                    textKey: "downloadPNG",
                    onclick: function() {
                        this.exportChartLocal()
                    }
                },
                downloadJPEG: {
                    textKey: "downloadJPEG",
                    onclick: function() {
                        this.exportChartLocal({
                            type: "image/jpeg"
                        })
                    }
                },
                downloadSVG: {
                    textKey: "downloadSVG",
                    onclick: function() {
                        this.exportChartLocal({
                            type: "image/svg+xml"
                        })
                    }
                },
                downloadPDF: {
                    textKey: "downloadPDF",
                    onclick: function() {
                        this.exportChartLocal({
                            type: "application/pdf"
                        })
                    }
                }
            }
        }
    });
    k(a, "Extensions/OfflineExporting/OfflineExporting.js", [a["Core/Chart/Chart.js"], a["Core/DefaultOptions.js"], a["Extensions/DownloadURL.js"], a["Extensions/Exporting/Exporting.js"], a["Core/Globals.js"], a["Extensions/OfflineExporting/OfflineExportingDefaults.js"], a["Core/Utilities.js"]], function(a, k, d, r, l, H, e) {
        var t = k.defaultOptions,
            m = d.downloadURL,
            b = l.win,
            x = l.doc,
            z = e.addEvent,
            y = e.error,
            I = e.extend,
            J = e.fireEvent,
            C = e.merge,
            D = [],
            v;
        (function(a) {
            function d(f, g) {
                var h = this,
                    c = C(h.options.exporting, f),
                    b = function(a) {
                        !1 === c.fallbackToExportServer ? c.error ? c.error(c, a) : y(28, !0) : h.exportChart(c)
                    };
                f = function() {
                    return [].some.call(h.container.getElementsByTagName("image"), function(a) {
                        a = a.getAttribute("href");
                        return "" !== a && 0 !== a.indexOf("data:")
                    })
                };
                l.isMS && h.styledMode && !r.inlineWhitelist.length && r.inlineWhitelist.push(/^blockSize/, /^border/, /^caretColor/, /^color/, /^columnRule/, /^columnRuleColor/, /^cssFloat/, /^cursor/, /^fill$/, /^fillOpacity/,
                    /^font/, /^inlineSize/, /^length/, /^lineHeight/, /^opacity/, /^outline/, /^parentRule/, /^rx$/, /^ry$/, /^stroke/, /^textAlign/, /^textAnchor/, /^textDecoration/, /^transform/, /^vectorEffect/, /^visibility/, /^x$/, /^y$/);
                l.isMS && ("application/pdf" === c.type || h.container.getElementsByTagName("image").length && "image/svg+xml" !== c.type) || "application/pdf" === c.type && f() ? b("Image type not supported for this chart/browser.") : h.getSVGForLocalExport(c, g || {}, b, function(f) {
                    -1 < f.indexOf("<foreignObject") && "image/svg+xml" !==
                        c.type && (l.isMS || "application/pdf" === c.type) ? b("Image type not supportedfor charts with embedded HTML") : a.downloadSVGLocal(f, I({
                            filename: h.getFilename()
                        }, c), b, function() {
                            return J(h, "exportChartLocalSuccess")
                        })
                })
            }

            function k(a, g) {
                var f = x.getElementsByTagName("head")[0],
                    c = x.createElement("script");
                c.type = "text/javascript";
                c.src = a;
                c.onload = g;
                c.onerror = function() {
                    y("Error loading script " + a)
                };
                f.appendChild(c)
            }

            function e(f, g, h, c) {
                var b = this,
                    d = function() {
                        e && q === e.length && c(b.sanitizeSVG(p.innerHTML, n))
                    },
                    k = function(a, f, c) {
                        ++q;
                        c.imageElement.setAttributeNS("http://www.w3.org/1999/xlink", "href", a);
                        d()
                    },
                    m, p, n, l = null,
                    e, q = 0;
                b.unbindGetSVG = z(b, "getSVG", function(a) {
                    n = a.chartCopy.options;
                    e = (p = a.chartCopy.container.cloneNode(!0)) && p.getElementsByTagName("image") || []
                });
                b.getSVGForExport(f, g);
                try {
                    if (!e || !e.length) {
                        c(b.sanitizeSVG(p.innerHTML, n));
                        return
                    }
                    var w = 0;
                    for (m = e.length; w < m; ++w) {
                        var u = e[w];
                        (l = u.getAttributeNS("http://www.w3.org/1999/xlink", "href")) ? a.imageToDataUrl(l, "image/png", {
                                imageElement: u
                            }, f.scale,
                            k, h, h, h): (++q, u.parentNode.removeChild(u), d())
                    }
                } catch (A) {
                    h(A)
                }
                b.unbindGetSVG()
            }

            function v(f, g, h, c, d, e, k, m, p) {
                var n = new b.Image,
                    l = function() {
                        setTimeout(function() {
                            var a = x.createElement("canvas"),
                                b = a.getContext && a.getContext("2d");
                            try {
                                if (b) {
                                    a.height = n.height * c;
                                    a.width = n.width * c;
                                    b.drawImage(n, 0, 0, a.width, a.height);
                                    try {
                                        var e = a.toDataURL(g);
                                        d(e, g, h, c)
                                    } catch (F) {
                                        q(f, g, h, c)
                                    }
                                } else k(f, g, h, c)
                            } finally {
                                p && p(f, g, h, c)
                            }
                        }, a.loadEventDeferDelay)
                    },
                    E = function() {
                        m(f, g, h, c);
                        p && p(f, g, h, c)
                    };
                var q = function() {
                    n = new b.Image;
                    q = e;
                    n.crossOrigin = "Anonymous";
                    n.onload = l;
                    n.onerror = E;
                    n.src = f
                };
                n.onload = l;
                n.onerror = E;
                n.src = f
            }

            function B(f) {
                var g = b.navigator.userAgent;
                g = -1 < g.indexOf("WebKit") && 0 > g.indexOf("Chrome");
                try {
                    if (!g && !l.isFirefox && -1 === f.indexOf("<foreignObject")) return a.domurl.createObjectURL(new b.Blob([f], {
                        type: "image/svg+xml;charset-utf-16"
                    }))
                } catch (h) {}
                return "data:image/svg+xml;charset=UTF-8," + encodeURIComponent(f)
            }

            function G(a, g) {
                var f = a.width.baseVal.value + 2 * g;
                g = a.height.baseVal.value + 2 * g;
                f = new b.jsPDF(g > f ? "p" :
                    "l", "pt", [f, g]);
                [].forEach.call(a.querySelectorAll('*[visibility="hidden"]'), function(a) {
                    a.parentNode.removeChild(a)
                });
                g = a.querySelectorAll("linearGradient");
                for (var c = 0; c < g.length; c++)
                    for (var d = g[c].querySelectorAll("stop"), e = 0; e < d.length && "0" === d[e].getAttribute("offset") && "0" === d[e + 1].getAttribute("offset");) d[e].remove(), e++;
                [].forEach.call(a.querySelectorAll("tspan"), function(a) {
                    "\u200b" === a.textContent && (a.textContent = " ", a.setAttribute("dx", -5))
                });
                b.svg2pdf(a, f, {
                    removeInvalid: !0
                });
                return f.output("datauristring")
            }
            a.CanVGRenderer = {};
            a.domurl = b.URL || b.webkitURL || b;
            a.loadEventDeferDelay = l.isMS ? 150 : 0;
            a.compose = function(a) {
                if (-1 === D.indexOf(a)) {
                    D.push(a);
                    var b = a.prototype;
                    b.getSVGForLocalExport = e;
                    b.exportChartLocal = d;
                    C(!0, t.exporting, H)
                }
                return a
            };
            a.downloadSVGLocal = function(f, g, d, c) {
                var e = x.createElement("div"),
                    h = g.type || "image/png",
                    l = (g.filename || "chart") + "." + ("image/svg+xml" === h ? "svg" : h.split("/")[1]),
                    r = g.scale || 1,
                    p = g.libURL || t.exporting.libURL,
                    n = !0;
                p = "/" !== p.slice(-1) ? p + "/" : p;
                var z = function() {
                    e.innerHTML = f;
                    var a = e.getElementsByTagName("text"),
                        b;
                    [].forEach.call(a, function(a) {
                        ["font-family", "font-size"].forEach(function(b) {
                            for (var c = a; c && c !== e;) {
                                if (c.style[b]) {
                                    a.style[b] = c.style[b];
                                    break
                                }
                                c = c.parentNode
                            }
                        });
                        a.style["font-family"] = a.style["font-family"] && a.style["font-family"].split(" ").splice(-1);
                        b = a.getElementsByTagName("title");
                        [].forEach.call(b, function(b) {
                            a.removeChild(b)
                        })
                    });
                    a = G(e.firstChild, 0);
                    try {
                        m(a, l), c && c()
                    } catch (F) {
                        d(F)
                    }
                };
                if ("image/svg+xml" === h) try {
                        if ("undefined" !== typeof b.navigator.msSaveOrOpenBlob) {
                            var y =
                                new MSBlobBuilder;
                            y.append(f);
                            var q = y.getBlob("image/svg+xml")
                        } else q = B(f);
                        m(q, l);
                        c && c()
                    } catch (u) {
                        d(u)
                    } else if ("application/pdf" === h) b.jsPDF && b.svg2pdf ? z() : (n = !0, k(p + "jspdf.js", function() {
                        k(p + "svg2pdf.js", function() {
                            z()
                        })
                    }));
                    else {
                        q = B(f);
                        var w = function() {
                            try {
                                a.domurl.revokeObjectURL(q)
                            } catch (u) {}
                        };
                        v(q, h, {}, r, function(a) {
                            try {
                                m(a, l), c && c()
                            } catch (A) {
                                d(A)
                            }
                        }, function() {
                            var a = x.createElement("canvas"),
                                e = a.getContext("2d"),
                                g = f.match(/^<svg[^>]*width\s*=\s*"?(\d+)"?[^>]*>/)[1] * r,
                                q = f.match(/^<svg[^>]*height\s*=\s*"?(\d+)"?[^>]*>/)[1] *
                                r,
                                t = function() {
                                    b.canvg.Canvg.fromString(e, f).start();
                                    try {
                                        m(b.navigator.msSaveOrOpenBlob ? a.msToBlob() : a.toDataURL(h), l), c && c()
                                    } catch (K) {
                                        d(K)
                                    } finally {
                                        w()
                                    }
                                };
                            a.width = g;
                            a.height = q;
                            b.canvg ? t() : (n = !0, k(p + "canvg.js", function() {
                                t()
                            }))
                        }, d, d, function() {
                            n && w()
                        })
                    }
            };
            a.getScript = k;
            a.imageToDataUrl = v;
            a.svgToDataUrl = B;
            a.svgToPdf = G
        })(v || (v = {}));
        return v
    });
    k(a, "masters/modules/offline-exporting.src.js", [a["Core/Globals.js"], a["Extensions/OfflineExporting/OfflineExporting.js"]], function(a, k) {
        a.downloadSVGLocal = k.downloadSVGLocal;
        k.compose(a.Chart)
    })
});
//# sourceMappingURL=offline-exporting.js.map