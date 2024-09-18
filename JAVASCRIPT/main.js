let BRSVotes = 0;
let JanasenaVotes = 0;
let BJPVotes = 0;
let CONGRESSVotes = 0;

function updateVotes() {
    document.getElementById('brs-votes').innerText = BRSVotes;
    document.getElementById('janasena-votes').innerText = JanasenaVotes;
    document.getElementById('psp-votes').innerText = BJPVotes;
    document.getElementById('congress-votes').innerText = CONGRESSVotes;
}

document.getElementById('vote-brs').addEventListener('click', function() {
    BRSVotes++;
    updateVotes();
});

document.getElementById('vote-ysrcp').addEventListener('click', function() {
    JanasenaVotes++;
    updateVotes();
});

document.getElementById('vote-psp').addEventListener('click', function() {
    BJPVotes++;
    updateVotes();
});

document.getElementById('vote-CONGRESS').addEventListener('click', function() {
    CONGRESSVotes++;
    updateVotes();
});

document.getElementById('finish-voting').addEventListener('click', function() {
    let winner = '';
    let maxVotes = Math.max(BRSVotes, JanasenaVotes, BJPVotes, CONGRESSVotes);

    if (maxVotes === BRSVotes) {
        winner = 'BRS';
    } else if (maxVotes === JanasenaVotes) {
        winner = 'Janasena';
    } else if (maxVotes === BJPVotes) {
        winner = 'BJP';
    } else if (maxVotes === CONGRESSVotes) {
        winner = 'CONGRESS';
    }

    document.getElementById('winner').innerText = 'Winner: ' + winner;
});
