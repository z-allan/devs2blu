export const data = function datetimeBrazilFormat() {
    const d = new Date();
    const dia = d.getDate().toString().padStart(2, '0');
    const mes = (d.getMonth() + 1).toString().padStart(2, '0');
    const ano = d.getFullYear().toString().substring(2);
    const hr = d.getHours().toString().padStart(2, '0');
    const min = d.getMinutes().toString().padStart(2, '0');
    const seg = d.getSeconds().toString().padStart(2, '0');
    return `${dia}/${mes}/${ano} ${hr}:${min}:${seg}`;
}
