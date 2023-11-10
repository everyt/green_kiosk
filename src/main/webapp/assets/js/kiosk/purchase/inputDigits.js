/**
 * @param i number
 * @return 000,000,000
 */
const inputDigits = (i) => {
  const str = i.toString();
  const l = str.length;
  let result = '';
  let j = 0;
  
  for (let k = l - 1; k >= 0; k--) {
    j++;
    result += str[k];
    if (j % 3 === 0) result += ',';
  }
    
  return result.split('').reverse().join('');
}