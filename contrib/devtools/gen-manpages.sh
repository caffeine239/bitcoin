#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

MUSKCOIND=${MUSKCOIND:-$BINDIR/muskcoind}
MUSKCOINCLI=${MUSKCOINCLI:-$BINDIR/muskcoin-cli}
MUSKCOINTX=${MUSKCOINTX:-$BINDIR/muskcoin-tx}
MUSKCOINQT=${MUSKCOINQT:-$BINDIR/qt/muskcoin-qt}

[ ! -x $MUSKCOIND ] && echo "$MUSKCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
TSLAVER=($($MUSKCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for muskcoind if --version-string is not set,
# but has different outcomes for muskcoin-qt and muskcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$MUSKCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $MUSKCOIND $MUSKCOINCLI $MUSKCOINTX $MUSKCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${TSLAVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${TSLAVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
