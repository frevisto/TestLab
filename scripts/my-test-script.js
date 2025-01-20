// Alterar no Docker-compose.yml o volume para o caminho correto


import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
    vus: 10, // number of virtual users
    duration: '30s', // duration of the test
};

export default function () {
    let res = http.get('https://test.k6.io');
    check(res, {
        'status is 200': (r) => r.status === 200,
    });
    sleep(1);
}